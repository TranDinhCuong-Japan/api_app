import 'package:api_app/controller/new_product_controller.dart';
import 'package:api_app/controller/products_controller.dart';
import 'package:api_app/routers/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Detail extends StatelessWidget {
  final int pageId;
  final String pageName;
  const Detail({Key? key, required this.pageId, required this.pageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product;

    if(pageName=='product'){
      product = Get.find<ProductsController>().productsList[pageId];
    }else if(pageName=='newproduct'){
      product = Get.find<NewProductController>().newProductList[pageId];
    }
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                Get.toNamed(RouterHelper.getInit());
              },
                child: Text("Back")),
            SizedBox(height: 30,),
            Image(image: NetworkImage('http://192.168.11.3/laravelshopmobile/lib/storage/app/avatar/'+product.prodImg)),
            SizedBox(height: 10,),
            Center(child: Text(product.prodName))
          ],
        ),
      ),
    );
  }
}
