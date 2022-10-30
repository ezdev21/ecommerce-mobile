import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
      home: const MyHomePage(title: 'Ecommerce'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final searchController=TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Color(0Xff43db80),
        title: TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText:'I am looking for',
              fillColor:Colors.white,
              filled: true,
              hintText: 'I am looking for...'
            ),
          ),
        centerTitle: true,
        actions:[
          IconButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>SearchPage(),settings:RouteSettings(arguments:{searchQuery:searchController.text})));
            },
            icon:Icon(Icons.search)
          ),
        ]
      ),
      body: Center(
        child: SpinKitFadingCube(
          size:140,
          color: Color(0Xff43db80)
        )
      ),
    );
  }
}
