import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ecommerce_mobile/screens/product/search_page.dart';
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
  List<dynamic> items=[];
  Future<void> getItems() async{
    var res=await http.get(Uri.parse('http://127.0.0.1:8001/api/videos'));
    items=jsonDecode(res.body);
  } 
  
  @override
  void initState() {
    getItems();
    super.initState();
  }

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
              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>SearchPage(),settings:RouteSettings(arguments:{searchController.text})));
            },
            icon:Icon(Icons.search)
          ),
        ]
      ),
      body: items.length==0 ?
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
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network('https://cdn.pixabay.com/photo/2022/09/26/23/26/african-american-7481724_960_720.jpg'),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('item title',style:TextStyle(fontSize:17,fontWeight: FontWeight.w600)),
                    Text('item.description',style:TextStyle(fontSize:15,color: Colors.grey[600]))
                  ]
                )
              ]
            ),
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.circular(5)
            ), 
          );
        },
      )
    );
  }
}
