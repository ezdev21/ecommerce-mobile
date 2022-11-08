import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_mobile/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:io';
//import 'package:device_info_plugin/device_info_plugin.dart';

class Auth extends ChangeNotifier{
  var user;
  bool logged=false;
  var token;
  final storage = new FlutterSecureStorage();

  bool get authenticated => logged;
  User get getUser => user;
  
  void login(Map creds) async{
    try {
     var res=await Dio().post('/sanctum/token',data:creds);
     token=res.data.toString();
     tryToken(token);
     logged=true; 
    }catch(e){
      
    }
    notifyListeners();
  }

  tryToken(token) async{
    if(token==null){
      return;
    }
    else{
      try{
        var res=await Dio().get(
          '/user',
          //options:Dio.Options(headers:{'Authorization':'Bearer $token'})
        );
        logged=true;
        user=User.fromJson(res.data);
        token=token;
        storeToken(token);
        notifyListeners(); 
      }catch(e){
        
      }
    }
  }

  void storeToken(String token){
    storage.write(key: 'token', value: token);   
  }

  void logout() async{
    try{
      //var res=await Dio().get('/user/revoke',options:Dio.options(headers:{'Authorization':'Bearer $token'}));
      cleanUp();
      notifyListeners(); 
    }catch(e){
      
    }
  }

  void cleanUp() async{
    user=null;
    logged=false;
    token=null;
    await storage.delete(key: 'token');
  }

  getDeviceInfo() async{
    String device_name='';
    // if(Platform.isAndroid){
    //   var deviceInfo = DeviceInfoPlugin();
    //   var androidInfo = await deviceInfo.androidInfo;
    //   device_name=androidInfo.model;
    // }
    // else if(Platform.isIOS){
    //   IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    //   device_name=iosInfo.utsname.machine;
    // }
    // else{
    //   device_name='unknown';
    // }
    return device_name;
  }
}