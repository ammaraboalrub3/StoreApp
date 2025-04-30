import 'package:dio/dio.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_modle.dart';

class CategoriesServices {
  final dio = Dio();
  Future<List<ProductModel>> getCategoriesProduct(
      {required String category}) async {
    List<dynamic> data = await Api()
        .get(url: "https://fakestoreapi.com/products/category/$category");
    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;
  }
}
