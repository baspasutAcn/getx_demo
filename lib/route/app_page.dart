import 'package:get/get.dart';
import 'package:getx_demo/views/form_page.dart';
import 'package:getx_demo/views/product_page_v2.dart';

class AppPage {
  static var list = [
    GetPage(name: "/login", page: () => const FormPage()),
    GetPage(name: "/product", page: () => const ProductPageV2())
  ];
}