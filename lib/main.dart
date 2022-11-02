import 'package:flutter/material.dart';
import 'package:ecommerce_mobile/screens/home_page.dart';
void main() {
  runApp(const MyApp());
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
      home: const HomePage(title: 'Ecommerce'),
    );
  }
}