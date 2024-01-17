import 'package:get/get.dart';
import 'package:getx_demo/controllers/product_controller.dart';

class AppControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController(), fenix: true);
  }
}