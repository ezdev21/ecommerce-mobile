import 'package:dio/dio.dart';
import 'package:ecommerce_mobile/widgets/app_drawer.dart';
import 'package:ecommerce_mobile/widgets/custom_app_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ProductCreate extends StatefulWidget {
  const ProductCreate({super.key});

  @override
  State<ProductCreate> createState() => _ProductCreateState();
}

class _ProductCreateState extends State<ProductCreate> {
  final titleController=TextEditingController();
  final descriptionController=TextEditingController();
  PlatformFile? image;

  Future captureImage() async{
    final result=await FilePicker.platform.pickFiles();
    final image=result!.files.first;
  }

  Future submit() async{
    try{
    Dio().post('/video/store',data:{
    'title':titleController.text,
    'description':descriptionController.text,
    'image':image,
  }); 
    }catch(e){
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('add a new product here',textAlign: TextAlign.center, style: TextStyle(color:Colors.grey[600],fontSize: 25,fontFamily: 'Pacifico'),),
            SizedBox(height: 10,),
            Text('product title',style: TextStyle(fontSize: 18),),
            SizedBox(height:10),
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'product title',
                fillColor:Colors.white,
                filled:true,
                contentPadding: EdgeInsets.all(3),
                enabledBorder: OutlineInputBorder(
                  borderSide:BorderSide(width: 2,color: Colors.grey.shade400),
                  borderRadius:BorderRadius.circular(5)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:BorderSide(width: 2,color: Color(0Xff43db80)),
                  borderRadius:BorderRadius.circular(5)
                ),
              )
            ),
            SizedBox(height:10),
            Text('upload image',style: TextStyle(fontSize: 18)),
            SizedBox(height:10),
            TextButton.icon(
              onPressed: ()=>captureImage(),
              style: TextButton.styleFrom(padding: EdgeInsets.all(15), foregroundColor: Colors.white, backgroundColor: Color(0Xff43db80)),
              icon: Icon(Icons.file_upload),
              label: Text('upload image here',style: TextStyle(fontSize: 18))
            ),
            SizedBox(height: 10,),
            Text('product description',style: TextStyle(fontSize: 18)),
            SizedBox(height:10),
            TextFormField(
              controller: descriptionController,
              maxLines: 6,
              decoration: InputDecoration(
                labelText: 'description',
                fillColor:Colors.white,
                filled:true,
                contentPadding: EdgeInsets.all(3),
                enabledBorder: OutlineInputBorder(
                  borderSide:BorderSide(width: 2,color: Colors.grey.shade400),
                  borderRadius:BorderRadius.circular(5)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:BorderSide(width: 2,color: Color(0Xff43db80)),
                  borderRadius:BorderRadius.circular(5)
                ),
              ),
            ),
            SizedBox(height: 10,),
            MaterialButton(
              onPressed: ()=>submit(),
              child: Text('Submit',style: TextStyle(fontSize: 18),),
              color: Color(0Xff43db80),
              height: 50,
              textColor: Colors.white,
              minWidth: double.infinity,
              padding: EdgeInsets.all(10),
            )
          ],
        ),
      ),
    );
  }
}