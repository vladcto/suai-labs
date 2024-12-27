import 'package:dio/dio.dart';

class AuthApi {
  final Dio _dio;

  AuthApi(this._dio);

  Future<String> authorize(String username, String password) async {
    final response = await _dio.post('/authorize', queryParameters: {
      'name': username,
      'password': password,
    });

    return response.data['token'];
  }
}
