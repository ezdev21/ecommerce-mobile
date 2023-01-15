import 'package:ecommerce_mobile/screens/auth/login.dart';
import 'package:ecommerce_mobile/screens/auth/register.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_mobile/services/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductProvider extends ChangeNotifier{
  //User? user=Auth!.user;
  bool like=false;
  bool dislike=false;

  Future captureImage() async{
    final result=await FilePicker.platform.pickFiles();
    final image=result!.files.first;
  }

  void showToast(String status){
    Fluttertoast.showToast(
      msg: status=="success"? "Product ready for sell!" : "error occured while selling a product",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      backgroundColor: status=="success"? const Color(0Xff43db80) : Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
    );
  }

  Future createProduct(Map data) async{
    try{
      dio().post('/video/store',data:data);
      showToast("success");
    }catch(e){
      showToast("error");
    }
    notifyListeners();
  }

  Future openDialog(String type,context){
    return showDialog(
      context: context,
      builder: ((context) => AlertDialog(
        title: Text('want to $type this product?',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
        content:const Text('sign in to make your opinion count.'),
        actions: [
          TextButton(
            onPressed:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Login())); 
            },
            child: const Text('sign in',style: TextStyle(color:Color(0Xff43db80)),)
          ),
          MaterialButton(
            onPressed:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Register())); 
            },
            color: const Color(0Xff43db80),
            child: const Text('sign up',style: TextStyle(color:Colors.white),)
          ), 
        ],
      ))
    );
  }

  double initialRating()
  {
    //return (product.totalLikes)/(product.totalLikes+product.totalDislikes)*5;
    return 4.5;
  }

  void likeProduct() async{
    //dio().post('/product/${product.id}/like',data: {'userId':'${user.id}','productId':'${product.id}','type':'like'});
    like=!like;
    if(dislike){
      dislike=false;
    }
  }
  
  void dislikeProduct() async{
    //dio().post('/product/${product.id}/like',data: {'userId':'${user.id}','productId':'${product.id}','type':'dislike'});
    dislike=!dislike;
    if(like){
      like=false;
    }
  }

  void watchLater() async{
    //var res=await dio().post('/product/watch-later',data:{'userId':user.id,'productId':product.id});
  }

  void addToFavourite() async{
    //var res=await dio().post('/product/add-to-favourite',data:{'userId':user.id,'productId':product.id});
  }

  void addToCart() async{
    //var res=await dio().post('/product/add-to-cart',data:{'userId':user.id,'productId':product.id});
  }
}