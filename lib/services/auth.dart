
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Auth extends ChangeNotifier{
  bool logged=false;

  bool get authenticated => logged;

  void login(Map creds){
    try {
     Dio().post('/sanctum/token',data:creds);
     logged=true; 
    }catch(e){
      
    }
    notifyListeners();
  }
  void logout(){
    logged=false;
    notifyListeners();
  }
}