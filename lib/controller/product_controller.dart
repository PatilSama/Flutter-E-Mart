import 'package:flutter/services.dart';
import 'package:flutter_emart/consts/consts.dart';
import 'package:flutter_emart/models/category_model.dart';

class ProductController  extends GetxController{
var subcat =[];
  getSubCategories(title)async{
    subcat.clear();
    var data = rootBundle.loadString("lib/services/category_model.json");
    var decoded = categoryModelFromJson(await data);
    print("Category decoded = ${decoded}");
    var s = decoded.categories.where((elements)=>elements.name==title).toList();

    print("list Category = ${s.toString()}");
    // for(var e in s){
    //   subcat.add(e.subcategory);
    // }
    for(var e in s[0].subcategory){
      subcat.add(e);
    }

  }
}