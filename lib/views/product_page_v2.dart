import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/product_controller.dart';

class ProductPageV2 extends StatefulWidget {
  const ProductPageV2({Key? key}) : super(key: key);

  @override
  State<ProductPageV2> createState() => _ProductPageV2State();
}

class _ProductPageV2State extends State<ProductPageV2> {
  final productController = Get.find<ProductController>();

  final List<String> tabs = [
    "Clothes",
    "Electronics",
    "Furniture",
    "Shoes",
    "Miscellaneous"
  ];

  Future<void> _getProducts() async {
    await productController.getProducts();
  }

  @override
  void initState() {
    super.initState();
    _getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Products")),
          actions: [
            TextButton(onPressed: () => Get.back(), child: const Text("Back"))
          ],
          backgroundColor: Colors.white,
          elevation: 0.5,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: tabs.length,
                      itemBuilder: (context, index) {
                        return FittedBox(
                          child: Container(
                            height: 40,
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            decoration: BoxDecoration(
                              color: Colors.black12.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                tabs[index],
                                style: const TextStyle(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    final products = productController.products;
                    return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 0.55,
                          crossAxisSpacing: 0,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade800),
                                  borderRadius: BorderRadius.circular(20)),
                              height: 150,
                              width: 150,
                              margin: const EdgeInsets.all(16),
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 150,
                                    child: Center(
                                      child: InkWell(
                                        onTap: () {},
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            products[index].image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    constraints:
                                        const BoxConstraints(minHeight: 120),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(products[index].title,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                          products[index].description,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Price",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            "${products[index].price.toString()} \$",
                                            style: const TextStyle(
                                              color: Colors.red,
                                            ),
                                          ),
                                        ]),
                                  )
                                ],
                              ));
                        });
                  }),
                ],
              ),
            ),
          ),
        ));
  }
}
