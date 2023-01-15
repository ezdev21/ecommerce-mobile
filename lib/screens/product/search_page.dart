import 'package:ecommerce_mobile/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:dio/dio.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<dynamic> items=[];

  Future<void> getItems() async{
    var res=await Dio().get('/products/search');
    items=jsonDecode(res.data);
  } 
  
  @override
  void initState() {
    getItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(),
      body: Container(
        child: items.isEmpty ?
        const Center(
          child: SpinKitFadingCube(
            size:140,
            color: Color(0Xff43db80)
          )
        )
        :ListView.builder(
          itemCount: items.length,
          itemBuilder: (context,index){
            return Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(5)
              ), 
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network('https://cdn.pixabay.com/photo/2022/09/26/23/26/african-american-7481724_960_720.jpg'),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('item title',style:TextStyle(fontSize:17,fontWeight: FontWeight.w600)),
                      Text('item.description',style:TextStyle(fontSize:15,color: Colors.grey[600]))
                    ]
                  )
                ]
              ),
            );
          },
        )
      ),
    );
  }
}