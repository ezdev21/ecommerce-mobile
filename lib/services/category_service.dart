import 'package:ecommerce_mobile/screens/home_page.dart';
import 'package:ecommerce_mobile/services/dio.dart';
import 'package:flutter/material.dart';

class CategoryService extends ChangeNotifier{
  dynamic categories;
  var selectedCategories=[];

  void fetchCategories() async{
    var res=await dio().get('/categories');
    categories=res.data;
  }
  
  List getCategories(){
    return categories;
  }

  void addCategory(index){
    selectedCategories.add(index);
  }

  Future submit(context) async{
    var res=await dio().post('/categories');
    Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));
  }
}