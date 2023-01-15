import 'package:ecommerce_mobile/provider/auth_provider.dart';
import 'package:ecommerce_mobile/screens/product/product_show.dart';
import 'package:ecommerce_mobile/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:ecommerce_mobile/widgets/app_drawer.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final storage = const FlutterSecureStorage();
  final searchController=TextEditingController();
  List<dynamic> items=[];

  @override
  void initState() {
    readToken();
    getProducts();
    super.initState();
  }

  Future<void> getProducts() async{
    var res=await Dio().get('/products');
    items=jsonDecode(res.data);
  } 
  
  void readToken() async{
    String? token=await storage.read(key: 'token');
    Provider.of<AuthProvider>(context,listen: false).tryToken(token);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(),
      body: items.isEmpty?
      Padding(
        padding:const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Welcome to Ecommerce',style: TextStyle(color: Colors.grey[600], fontSize: 30, fontFamily: 'Pacifico'),),
            const SizedBox(height: 50,),
            const SpinKitFadingCube(
              size:140,
              color: Color(0Xff43db80)
            ),
          ],
        ),
      )
      : ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              var product=items[index];
              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const ProductShow(),settings:RouteSettings(arguments:{product})));
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(5)
              ), 
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                    'https://cdn.pixabay.com/photo/2022/09/26/23/26/african-american-7481724_960_720.jpg',
                    fit: BoxFit.cover,
                    ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('item title',style:TextStyle(fontSize:17,fontWeight: FontWeight.w600)),
                      Text('item.description',style:TextStyle(fontSize:15,color: Colors.grey[600]))
                    ]
                  )
                ]
              ),
            ),
          );
        },
      )
    );
  }
}
