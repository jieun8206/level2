import 'package:get/get.dart';
import 'package:level2/model/product_model.dart';

class CartContoller extends GetxController {
  var cartItems = <Product>[].obs;
  int get count => cartItems.length;


  // 아이템 담기
  void addToItem(Product product){
    cartItems.add(product);
  }

}