import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_demo/models/product_response.dart';
import 'package:getx_demo/service/product_service.dart';
import 'package:getx_demo/utils/api_constants.dart';

class ProductController extends GetxController {
  ProductService service = Get.find<ProductService>();

  final RxList<Product> products = <Product>[].obs;

  Future<void> getProducts() async {
    try {
      Response resp = await service.getProducts(ApiConstants.getProducts);

      final productsResponse = ProductResponse.fromJson(resp.body);

      if (resp.statusCode == 200){
        products.value = productsResponse.products;
      }
    } catch (exception) {
      Get.dialog(Text(exception.toString()));
    }
  }
}