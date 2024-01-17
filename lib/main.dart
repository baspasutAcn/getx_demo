import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/app_controller_binding.dart';
import 'package:getx_demo/route/app_page.dart';
import 'package:getx_demo/service/product_service.dart';
import 'package:getx_demo/utils/preference_utils.dart';
import 'package:getx_demo/views/form_page.dart';
import 'package:getx_demo/views/product_page.dart';
import 'package:getx_demo/views/product_page_v2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(() => ProductService().init());

  // AppControllerBinding().dependencies();

  await PreferenceUtils.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Practice',
      debugShowCheckedModeBanner: false,
      initialBinding: AppControllerBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: AppPage.list,
      home: const FormPage(),
    );
  }
}
