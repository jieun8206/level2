import 'package:get/get.dart';
import '../model/product_model.dart';
import '../data/services.dart';
class Contoller extends GetxController{
  var productList = <Product>[].obs;
  var isLoading = false.obs;

  /// 초기화
  @override
  void onInit(){
    isLoading.toggle();
    super.onInit();
    fetchData();
  }

  void fetchData() async{
    var products = await Services.fetchProducts();
    if (products != null){
      productList.value = products;
      isLoading.toggle();
    }
  }

}