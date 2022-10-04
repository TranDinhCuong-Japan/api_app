import 'package:api_app/model/product_model.dart';
import 'package:api_app/repo/new_product_repo.dart';
import 'package:get/get.dart';

class NewProductController extends GetxController{
 final NewProductRepo newProductRepo;

 NewProductController({required this.newProductRepo});

 List<dynamic> _getNewProductList=[];
 List<dynamic> get newProductList => _getNewProductList;

 Future<void> getNewProductList() async{
   Response response = await newProductRepo.getNewProductList();
   if(response.statusCode==200){
     print("data lost");
     _getNewProductList=[];
     List<dynamic> newProduct = List<dynamic>.of(response.body);
     newProduct.forEach((element) {
       _getNewProductList.add(
         ProductModel(
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
         )
       );
     });
     update();
   }else{
     print('Product connect error '+response.statusText.toString() + response.statusCode.toString());
   }
 }
}