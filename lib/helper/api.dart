import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  final dio = Dio();
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> queryParameters = {};

    if (token != null) {
      queryParameters.addAll({
        "Authorization": "Bearer $token",
      });
    }

    try {
      Response response = await dio.get(url, queryParameters: queryParameters);
      return response.data;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> queryParameters = {};

    if (token != null) {
      queryParameters.addAll({
        "Authorization": "Bearer $token",
      });
    }
    try {
      Response response = await dio.post(
        url,
        data: body,
        queryParameters: queryParameters,
      );

      Map<String, dynamic> data = response.data;
      return data;
    } on Exception {
      throw Exception("error");
    }
  }

  Future<dynamic> put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> queryParameters = {};
    queryParameters.addAll({
      "Content-Type": "application/x-www-form-urlencoded",
    });

    if (token != null) {
      queryParameters.addAll({
        "Authorization": "Bearer $token",
      });
    }
    try {
      Response response = await dio.put(
        url,
        data: body,
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        print(data);
        return data;
      } else {
        // Handle other status codes (e.g., 401, 403, 500)
        throw Exception(
            "API request failed with status code: ${response.statusCode}");
      }
    } on Exception catch (e) {
      throw Exception(e); // Re-throw the exception
    }
  }
}
