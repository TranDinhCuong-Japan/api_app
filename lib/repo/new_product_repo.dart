import 'package:api_app/api/api.client.dart';
import 'package:get/get.dart';

class NewProductRepo extends GetxService{
  final ApiClient apiClient;
  
  NewProductRepo({required this.apiClient});
  
  Future<Response> getNewProductList() async{
    return await apiClient.getData("http://192.168.11.3/laravelshopmobile/product/newproduct");
  }
}