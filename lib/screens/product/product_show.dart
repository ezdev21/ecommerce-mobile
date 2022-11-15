import 'package:ecommerce_mobile/models/product.dart';
import 'package:ecommerce_mobile/models/user.dart';
import 'package:ecommerce_mobile/services/auth.dart';
import 'package:ecommerce_mobile/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_mobile/services/dio.dart';

class ProductShow extends StatefulWidget {
  const ProductShow({super.key});

  @override
  State<ProductShow> createState() => _ProductShowState();
}

class _ProductShowState extends State<ProductShow> {
  //User? user=Auth!.user;
  bool like=false;
  bool dislike=false;
  dynamic product;
  var recommendedProducts=[1];
  void likeProduct() async{
    //dio().post('/product/${product.id}/like',data: {'userId':'${user.id}','productId':'${product.id}','type':'like'});
    like=!like;
    if(dislike){
      dislike=false;
    }
  }
  
  void dislikeProduct() async{
    //dio().post('/product/${product.id}/like',data: {'userId':'${user.id}','productId':'${product.id}','type':'dislike'});
    dislike=!dislike;
    if(like){
      like=false;
    }
  }

  @override
  Widget build(BuildContext context) {
    product=ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              //'${product.image}'
              'https://media.istockphoto.com/id/1405163092/photo/3d-render-of-sport-running-shoe-isolated-on-pastel-background-3d-background-minimal-scene.jpg?s=612x612&w=is&k=20&c=55ZC86AZBWD60IbclH2UnKj-93DpR34dDVI9HXzCpFo='
              ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('new nike shoes',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),
                  Text('new nike shoes',style: TextStyle(fontSize: 16,color: Colors.grey[700])),
                  Row(children: [
                    IconButton(
                      onPressed: (){
                      likeProduct();
                      },
                      icon: Icon(Icons.thumb_up)
                    ),
                    //Text('${product.totalLikes}'),
                    SizedBox(width: 20,),
                    IconButton(
                      onPressed: (){
                        dislikeProduct();
                      },
                      icon: Icon(Icons.thumb_down)
                    ),
                    //Text('${product.totalDislikes}'),
                  ],
                  ),
                  Text('Recommended Products',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),
                  SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: ListView.builder(
                      itemCount: recommendedProducts.length,
                      itemBuilder: (context,index){
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                width:MediaQuery.of(context).size.width/2,
                                'https://media.istockphoto.com/id/1405163092/photo/3d-render-of-sport-running-shoe-isolated-on-pastel-background-3d-background-minimal-scene.jpg?s=612x612&w=is&k=20&c=55ZC86AZBWD60IbclH2UnKj-93DpR34dDVI9HXzCpFo='
                              ),
                              SizedBox(width: 5,),
                              Column(
                                children: [
                                  Text('new nike shoes',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),
                                  Text('new nike shoes',style: TextStyle(fontSize: 16,color: Colors.grey[700])),
                                ],
                              )
                            ],
                          ),
                        );
                      }
                    ),
                  )
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}