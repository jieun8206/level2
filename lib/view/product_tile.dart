import 'package:flutter/material.dart';

import '../contoller/cart_contoller.dart';
import '../model/product_model.dart';
import 'package:get/get.dart';
class ProductTile  extends StatelessWidget {
  final Product product;
  ProductTile(this.product);
  @override
  Widget build(BuildContext context){
    return Card(
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: 100,
                  height: 85,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(4),
                  ),
                  child: Image.network(
                    product.imageLink,
                    fit:BoxFit.fill),
                ),
               Obx(()=> CircleAvatar(
                    backgroundColor:Colors.white,
                    radius: 15,
                    child: IconButton(
                      icon: product.like.value
                          ? Icon(Icons.favorite_rounded)
                          : Icon(Icons.favorite_border),
                      onPressed: (){
                        product.like.toggle();
                      },
                      iconSize: 18,
                    ),
                  ),
                ),
              ],
            ),


            const SizedBox(height: 5,),
            Text(product.name,
              maxLines: 2,
              style:const TextStyle(fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color:Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical:2),
                  child:Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(product.rating.toString(), style:const TextStyle(color:Colors.white)),
                      const Icon(Icons.star, size:16, color:Colors.white),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color:Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical:2),
                  child:Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 120,
                        height:15,
                        child: ElevatedButton(
                            onPressed: () {
                              CartContoller c = Get.find<CartContoller>();
                              c.addToItem(product);
                            },
                            child: const Text('Add to Cart')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 3,),
            Text('\$${product.price}',
              style:const TextStyle(fontSize:20),
            )

          ],
        ),
      ),
    );
  }

}