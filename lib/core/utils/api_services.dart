import 'package:dio/dio.dart';

class ApiServices {
  final dio = Dio();
  final baseUrl = "https://www.googleapis.com/books/v1/";

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var result = await dio.get("$baseUrl$endPoint");
    return result.data;
  }
}
