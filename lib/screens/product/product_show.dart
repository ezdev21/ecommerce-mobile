import 'package:flutter/material.dart';
import 'package:ecommerce_mobile/services/dio.dart';

class ProductShow extends StatefulWidget {
  const ProductShow({super.key});

  @override
  State<ProductShow> createState() => _ProductShowState();
}

class _ProductShowState extends State<ProductShow> {
  final product=ModalRoute.of(context).settings.arguments;
  bool like=false;
  bool dislike=false;
  
  void likeProduct() async{
    dio().post('/product/${product.id}/like',data: {'userId':'${user.id}','productId':'${product.id}','type':'like'});
    like=!like;
    if(dislike){
      dislike=false;
    }
  }
  
  void dislikeProduct() async{
    dio().post('/product/${product.id}/like',data: {'userId':'${user.id}','productId':'${product.id}','type':'dislike'});
    dislike=!dislike;
    if(like){
      like=false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network('${product.image}'),
          SizedBox(height: 10),
          Text('${product.title}'),
          Text('${product.description}'),
          Row(children: [
            IconButton(
              onPressed: (){
               likeProduct();
              },
              icon: Icon(Icons.thumb_up)
            ),
            Text('${product.totalLikes}'),
            SizedBox(width: 20,),
            IconButton(
              onPressed: (){
                dislikeProduct();
              },
              icon: Icon(Icons.thumb_down)
            ),
            Text('${product.totalDislikes}'),
          ],)
        ],
      ),
    );
  }
}