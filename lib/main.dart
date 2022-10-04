import 'package:api_app/controller/products_controller.dart';
import 'package:api_app/pages/detail.dart';
import 'package:api_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:api_app/helper/denpendencies.dart' as dep;
import 'package:get/get.dart';
import 'package:api_app/routers/router.dart';

Future<void> main() async {
  await dep.init();
  runApp(const ApiApp());
}

class ApiApp extends StatelessWidget {
  const ApiApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(builder: (_){
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // home: HomePage(),
        initialRoute: RouterHelper.getInit(),
        getPages: RouterHelper.routers,
      );
    });
  }
}
