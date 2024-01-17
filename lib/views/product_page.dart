import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/product_controller.dart';

class ProductPage extends StatelessWidget {
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    productController.getProducts();

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Row(children: [
          Expanded(
            child: GetX<ProductController>(builder: (controller) {
              return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: const EdgeInsets.all(12),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Image.network(
                                    controller.products[index].image),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Flexible(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.products[index].title,
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                        controller.products[index].description),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ])));
  }
}
