import 'package:api_app/pages/detail.dart';
import 'package:api_app/pages/home.dart';
import 'package:get/get.dart';

class RouterHelper{
  static String init ="/";
  static String detail ="/detail";

  static String getInit()=>"$init";
  static String getDetail(int pageId, String pageName) =>"$detail?pageId=$pageId&pageName=$pageName";

  static List<GetPage> routers =
      [
        GetPage(name: init, page: ()=>HomePage()),
        GetPage(name: detail, page: (){
          var pageId = Get.parameters["pageId"];
          var pageName = Get.parameters["pageName"];
          return Detail(pageId: int.parse(pageId!), pageName: pageName!,);
        })
      ];
}