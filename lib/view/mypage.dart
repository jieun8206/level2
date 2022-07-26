import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:level2/view/product_tile.dart';
import '../contoller/cart_contoller.dart';
import '../contoller/contoller.dart';

class MyPage extends StatelessWidget{

  final contoller = Get.put(Contoller());
  final cartController = Get.put(CartContoller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chef Shop'),
        backgroundColor: Colors.black87,
        elevation: 0,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.view_list_rounded)),
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          child:Obx(()=>
            contoller.isLoading == true
                ? const Center(child:CircularProgressIndicator())
                : GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index){
                      return ProductTile(contoller.productList[index]);
                    },
                    itemCount:contoller.productList.length,
                ),
          )),
        ),

      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){},
          label: GetX<Contoller>(
            builder:(contoller){
              return Text('Item:' +cartController.count.toString(),
                style:const TextStyle(fontSize: 20),
              );
            }
          ),
        icon: const Icon(Icons.add_shopping_cart_rounded),
      ),
    );
  }

}