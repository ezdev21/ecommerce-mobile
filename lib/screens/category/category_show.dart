import 'package:ecommerce_mobile/screens/home_page.dart';
import 'package:ecommerce_mobile/services/dio.dart';
import 'package:ecommerce_mobile/widgets/app_drawer.dart';
import 'package:ecommerce_mobile/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CategoryShow extends StatefulWidget {
  const CategoryShow({super.key});

  @override
  State<CategoryShow> createState() => _CategoryShowState();
}

class _CategoryShowState extends State<CategoryShow> {
  dynamic categories;
  var selectedCategories=[];

  @override
  void initState() {
    getCategories();
    super.initState();
  }
  
  void getCategories() async{
    var res=await dio().get('/categories');
    categories=res.data;
  }

  void addCategory(index){
    selectedCategories.add(index);
  }
  Future submit() async{
    var res=await dio().post('/categories');
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('choose categories you want to get notification from',style: TextStyle(fontSize: 22,fontFamily: 'Pacifico',fontWeight: FontWeight.w500,color: Colors.grey[600]),),
            ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context,index){
                var category=categories[index];
                return CheckboxListTile(
                  title: Text('${category.text}'),
                  value: false,
                  onChanged: (newValue) {
                    addCategory(index); 
                  },
                  controlAffinity: ListTileControlAffinity.leading
                );  
              }
            ),
            SizedBox(height: 20,),
            MaterialButton(
              minWidth: double.infinity,
              height: 50,
              color: Color(0Xff43db80),
              textColor: Colors.white,
              onPressed: (){
                submit();
              },
              child: Text('Submit',style: TextStyle(fontSize: 18),),
            )            
          ],
        ), 
      ),
    );
  }
}