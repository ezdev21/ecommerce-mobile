import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_mobile/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
//import 'package:device_info_plus/device_info_plus.dart';

class AuthProvider extends ChangeNotifier{
  late User? user;
  bool logged=false;
  String? token='';
  final storage = const FlutterSecureStorage();

  bool get authenticated => logged;
  User? get getUser => user;
  
  void register(Map creds) async{
    try{
      Dio().post('sanctum/register',data:creds);
      showToast("success");
    }catch(e){
      showToast("error");
    }
  } 

  void login(Map creds) async{
    try {
     var res=await Dio().post('/sanctum/token',data:creds);
     token=res.data.toString();
     tryToken(token);
     logged=true;
    }catch(e){
     showToast("error"); 
    }
    notifyListeners();
  }

  tryToken(token) async{
    if(token==null){
      return;
    }
    else{
      try{
        var res=await Dio().get('/user',options:Options(headers:{'Authorization':'Bearer $token'}));
        logged=true;
        user=User.fromJson(res.data);
        token=token;
        storeToken(token);
        notifyListeners(); 
      }catch(e){
        showToast("error"); 
      }
    }
  }
  
  void storeToken(token){
    storage.write(key: 'token', value: token);   
  }

  void logout() async{
    try{
      await Dio().get('/user/revoke',options:Options(headers:{'Authorization':'Bearer $token'}));
      cleanUp();
      notifyListeners(); 
    }catch(e){
     showToast("error");  
    }
  }
  
  void showToast(String status){
    Fluttertoast.showToast(
      msg: status=="success"? "Account created successfully!" : "error occured while creating account",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      backgroundColor: status=="success"? const Color(0Xff43db80) : Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
    );
  } 

  void cleanUp() async{
    user=null;
    logged=false;
    token=null;
    await storage.delete(key: 'token');
  }
  
  getDeviceInfo() async{
    String deviceName='';
    if(Platform.isAndroid){
      //DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      //AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      //device_name=androidInfo.model;
    }
    else if(Platform.isIOS){
      //IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      //device_name=iosInfo.utsname.machine;
    }
    else{
      deviceName='unknown';
    }
    return deviceName;
  }
}