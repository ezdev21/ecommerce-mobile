import 'package:ecommerce_mobile/provider/product_provider.dart';
import 'package:ecommerce_mobile/widgets/app_drawer.dart';
import 'package:ecommerce_mobile/widgets/custom_app_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCreate extends StatefulWidget {
  const ProductCreate({super.key});

  @override
  State<ProductCreate> createState() => _ProductCreateState();
}

class _ProductCreateState extends State<ProductCreate> {
  final titleController=TextEditingController();
  final descriptionController=TextEditingController();
  PlatformFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('sell a new product',textAlign: TextAlign.center, style: TextStyle(color:Colors.grey[600],fontSize: 25,fontFamily: 'Pacifico'),),
            const SizedBox(height: 10,),
            const Text('product title',style: TextStyle(fontSize: 18),),
            const SizedBox(height:10),
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'product title',
                fillColor:Colors.white,
                filled:true,
                contentPadding: const EdgeInsets.all(3),
                enabledBorder: OutlineInputBorder(
                  borderSide:BorderSide(width: 2,color: Colors.grey.shade400),
                  borderRadius:BorderRadius.circular(5)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:const BorderSide(width: 2,color: Color(0Xff43db80)),
                  borderRadius:BorderRadius.circular(5)
                ),
              )
            ),
            const SizedBox(height:10),
            const Text('upload image',style: TextStyle(fontSize: 18)),
            const SizedBox(height:10),
            TextButton.icon(
              onPressed: (){
                Provider.of<ProductProvider>(context,listen: false).captureImage();
              }, 
              style: TextButton.styleFrom(padding: const EdgeInsets.all(15), foregroundColor: Colors.white, backgroundColor: const Color(0Xff43db80)),
              icon: const Icon(Icons.file_upload),
              label: const Text('upload image here',style: TextStyle(fontSize: 18))
            ),
            const SizedBox(height: 10,),
            const Text('product description',style: TextStyle(fontSize: 18)),
            const SizedBox(height:10),
            TextFormField(
              controller: descriptionController,
              maxLines: 6,
              decoration: InputDecoration(
                labelText: 'description',
                fillColor:Colors.white,
                filled:true,
                contentPadding: const EdgeInsets.all(3),
                enabledBorder: OutlineInputBorder(
                  borderSide:BorderSide(width: 2,color: Colors.grey.shade400),
                  borderRadius:BorderRadius.circular(5)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:const BorderSide(width: 2,color: Color(0Xff43db80)),
                  borderRadius:BorderRadius.circular(5)
                ),
              ),
            ),
            const SizedBox(height: 10,),
            MaterialButton(
              onPressed: (){
                Map data={
                  'title':titleController.text,
                  'description':descriptionController.text,
                  'image':image,
                };
                Provider.of<ProductProvider>(context,listen:false).createProduct(data);
              },
              color: const Color(0Xff43db80),
              height: 50,
              textColor: Colors.white,
              minWidth: double.infinity,
              padding: const EdgeInsets.all(10),
              child: const Text('Submit',style: TextStyle(fontSize: 18),)
            )
          ],
        ),
      ),
    );
  }
}