import 'dart:developer';

import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl ='https://api.themoviedb.org/3/';
  final _apiKey="api_key=a575ff9346c79d05054b17abbf63b36b";
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint,}) async {
    var response = await _dio.get('$_baseUrl$endPoint$_apiKey');
    log(response.data.toString(),name: "response");
    return response.data;
  }
}
