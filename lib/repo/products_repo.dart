import 'package:api_app/api/api.client.dart';
import 'package:get/get.dart';

class ProductsRepo extends GetxService{
  final ApiClient apiClient;

  ProductsRepo({required this.apiClient});

  Future<Response> getProductsList() async{
    return await apiClient.getData("http://192.168.11.3/laravelshopmobile/product");
  }
}