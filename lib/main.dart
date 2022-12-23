import 'package:ecommerce_mobile/provider/auth_provider.dart';
import 'package:ecommerce_mobile/provider/category_provider.dart';
import 'package:ecommerce_mobile/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_mobile/screens/home_page.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context)=>AuthProvider()),
        ChangeNotifierProvider(create: (context)=>ProductProvider()),
        ChangeNotifierProvider(create: (context)=>CategoryProvider()),
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}