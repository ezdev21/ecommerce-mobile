import 'package:ecommerce_mobile/provider/category_provider.dart';
import 'package:ecommerce_mobile/widgets/app_drawer.dart';
import 'package:ecommerce_mobile/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryShow extends StatefulWidget {
  const CategoryShow({super.key});

  @override
  State<CategoryShow> createState() => _CategoryShowState();
}

class _CategoryShowState extends State<CategoryShow> {

  @override
  void initState() {
    Provider.of<CategoryProvider>(context,listen: false).fetchCategories();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('choose categories you want to get notification from',style: TextStyle(fontSize: 22,fontFamily: 'Pacifico',fontWeight: FontWeight.w500,color: Colors.grey[600]),),
          ListView.builder(
            itemCount: Provider.of<CategoryProvider>(context,listen: false).categories.length,
            itemBuilder: (context,index){
              var category=Provider.of<CategoryProvider>(context,listen: false).categories[index];
              return CheckboxListTile(
                title: Text('${category.text}'),
                value: false,
                onChanged: (newValue) {
                  Provider.of<CategoryProvider>(context,listen: false).addCategory(index); 
                },
                controlAffinity: ListTileControlAffinity.leading
              );  
            }
          ),
          const SizedBox(height: 20,),
          MaterialButton(
            minWidth: double.infinity,
            height: 50,
            color: const Color(0Xff43db80),
            textColor: Colors.white,
            onPressed: (){
              Provider.of<CategoryProvider>(context,listen: false).submit(context);
            },
            child: const Text('Submit',style: TextStyle(fontSize: 18),),
          )            
        ],
      ),
    );
  }
}