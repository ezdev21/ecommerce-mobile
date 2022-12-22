import 'package:ecommerce_mobile/services/auth_service.dart';
import 'package:ecommerce_mobile/services/product_service.dart';
import 'package:ecommerce_mobile/services/category_service.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_mobile/screens/home_page.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context)=>AuthService()),
        ChangeNotifierProvider(create: (context)=>ProductService()),
        ChangeNotifierProvider(create: (context)=>CategoryService()),
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