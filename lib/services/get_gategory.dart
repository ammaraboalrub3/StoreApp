import 'package:dio/dio.dart';
import 'package:store_app/helper/api.dart';

class GetCategoryServices {
  final dio = Dio();

  Future<List<dynamic>> getAllCategory() async {
    List<dynamic> data =
        await Api().get(url: "https://fakestoreapi.com/products/categories");
    return data;
  }
}
