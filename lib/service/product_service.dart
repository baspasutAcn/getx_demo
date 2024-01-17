import 'package:get/get.dart';
import 'package:getx_demo/service/base_service.dart';

class ProductService extends GetConnect implements GetxService {
  Future<ProductService> init() async => this;

  BaseService baseService = BaseService();

  Future<Response> getProducts(String uri) async {
    Response response = await baseService.customGet(uri).timeout(const Duration(seconds: 10));
    return response;
  }
}