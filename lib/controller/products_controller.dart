import 'dart:convert';

import 'package:api_app/model/product_model.dart';
import 'package:api_app/repo/products_repo.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController{
   final ProductsRepo productsRepo;
   ProductsController({required this.productsRepo});

   List<dynamic> _getProductList=[];
   List<dynamic> get productsList => _getProductList;

   // Future<void> getProductsList() async{
   //   var response = await productsRepo.getProductsList();
   //   if(response.statusCode==200){
   //      _getProductList=[];
   //      List<dynamic> test = List<dynamic>.from(response.body);
   //      _getProductList.addAll(test);
   //      update();
   //      print(_getProductList.length);
   //   }else{
   //     print('else');
   //     print('Product connect error '+response.statusText.toString() + response.statusCode.toString());
   //   }
   // }

   Future<void> getProductsList() async{
     var response = await productsRepo.getProductsList();
     if(response.statusCode==200){
       _getProductList=[];
       List<dynamic> test = List<dynamic>.of(response.body);

       // var test2 = ProductModel.fromJson(jsonDecode(jsonEncode(test)));
       print(test);

       test.forEach((element) {_getProductList.add(ProductModel(
           prodId : element['prod_id'],
           prodName : element['prod_name'],
           prodSlug : element['prod_slug'],
           prodPrice : element['prod_price'],
           prodImg : element['prod_img'],
           prodWarranty : element['prod_warranty'],
           prodAccessories : element['prod_accessories'],
           prodCondition : element['prod_condition'],
           prodPromotion : element['prod_promotion'],
           prodStatus : element['prod_status'],
           proDescription : element['pro_description'],
           prodFeatured : element['prod_featured'],
           prodCate : element['prod_cate'],
           createdAt : element['created_at'],
           updatedAt : element['updated_at'],
       ));});
       update();
     }else{
       print('Product connect error '+response.statusText.toString() + response.statusCode.toString());
     }
   }


}