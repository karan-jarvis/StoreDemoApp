import 'package:store_demo_app/screens/home_screen/product_model.dart';
import 'package:store_demo_app/service/network/network.dart';
import 'package:store_demo_app/service/network/network_string.dart';

class HomeRepo {
  Future<List<ProductModel>?> fetchProducts(context) async {
    print("calling");
    try {
      var response = await NetworkAPICall()
          .get(url: ApiKey.getallProducts, context: context);
      List data = response;
      List<ProductModel> decodedList = [];
      print("data :- $data");
      for (var element in data) {
        decodedList.add(ProductModel.fromJson(element));
      }
      return decodedList;
      print("ProductModel =v $decodedList");
    } catch (e,stackTrac) {
      print("Error is :- $e");
      print("Error is :- $stackTrac");
      // Handle error (e.g., show a toast or alert)
    }
    return null;
  }
}
