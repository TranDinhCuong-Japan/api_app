import 'package:api_app/api/api.client.dart';
import 'package:api_app/controller/new_product_controller.dart';
import 'package:api_app/controller/products_controller.dart';
import 'package:api_app/repo/new_product_repo.dart';
import 'package:api_app/repo/products_repo.dart';
import 'package:get/get.dart';

Future<void> init() async{
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: "http://192.168.11.3/laravelshopmobile/product"));
  
  // repo
  Get.lazyPut(() => ProductsRepo(apiClient: Get.find()));
  Get.lazyPut(() => NewProductRepo(apiClient: Get.find()));

  // controller
  Get.lazyPut(() => ProductsController(productsRepo: Get.find()));
  Get.lazyPut(() => NewProductController(newProductRepo: Get.find()));

}