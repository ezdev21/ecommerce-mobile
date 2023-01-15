import 'package:flutter/material.dart';

  PreferredSizeWidget CustomAppBar() {
    final searchController=TextEditingController();
    return AppBar(
        backgroundColor: const Color(0Xff43db80),
        title: TextField(
            controller: searchController,
            decoration: const InputDecoration(
              labelText:'I am looking for...',
              fillColor:Colors.white,
              filled: true,
              hintText: 'I am looking for...'
            ),
          ),
        centerTitle: true,
        actions:[
          IconButton(
            onPressed: (){
              //Navigator.of(context).push(MaterialPageRoute(builder:(context)=>SearchPage(),settings:RouteSettings(arguments:{searchController.text})));
            },
            icon:const Icon(Icons.search)
          ),
        ]
      );
  }