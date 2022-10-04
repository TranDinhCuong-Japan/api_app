import 'package:api_app/controller/new_product_controller.dart';
import 'package:api_app/controller/products_controller.dart';
import 'package:api_app/routers/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget  {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Get.find<ProductsController>().getProductsList();
    Get.find<NewProductController>().getNewProductList();
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              controller: _tabController,
                tabs: [
                  Text("Product"),
                  Text("New product"),
                  Text("Recomment"),
                ]),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  GetBuilder<ProductsController>(
                      builder: (products) {
                        return Container(
                          padding: EdgeInsets.only(top: 30,left: 20, right: 20),
                          child: ListView.builder(
                              itemCount: products.productsList.length,
                              itemBuilder: (contex, index){
                                return GestureDetector(
                                  onTap: (){
                                    Get.toNamed(RouterHelper.getDetail(index, 'product'));
                                  },
                                  child: Container(
                                    height: 250,
                                    child: Stack(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          height: 200,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: NetworkImage('http://192.168.11.3/laravelshopmobile/lib/storage/app/avatar/'+products.productsList[index].prodImg),
                                                fit: BoxFit.cover
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 20,right: 20, bottom: 10),
                                            height: 100,
                                            width: 250,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(20),
                                                boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0,5), blurRadius: 5)]
                                            ),
                                            child: Container(
                                              padding: EdgeInsets.only(left: 20,right: 20),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(products.productsList[index].prodName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                                  Text('12,000,000 Vnd')
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        );
                      }
                  ),
                  GetBuilder<NewProductController>(
                      builder: (newProducts) {
                        return Container(
                          padding: EdgeInsets.only(top: 30,left: 20, right: 20),
                          child: ListView.builder(
                              itemCount: newProducts.newProductList.length,
                              itemBuilder: (contex, index){
                                return GestureDetector(
                                  onTap: (){
                                    Get.toNamed(RouterHelper.getDetail(index, 'newproduct'));
                                  },
                                  child: Container(
                                    height: 250,
                                    child: Stack(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          height: 200,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: NetworkImage('http://192.168.11.3/laravelshopmobile/lib/storage/app/avatar/'+newProducts.newProductList[index].prodImg),
                                                fit: BoxFit.cover
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 20,right: 20, bottom: 10),
                                            height: 100,
                                            width: 250,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(20),
                                                boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0,5), blurRadius: 5)]
                                            ),
                                            child: Container(
                                              padding: EdgeInsets.only(left: 20,right: 20),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(newProducts.newProductList[index].prodName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                                  Text('12,000,000 Vnd')
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        );
                      }
                  ),
                  Text('Tab 3')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
