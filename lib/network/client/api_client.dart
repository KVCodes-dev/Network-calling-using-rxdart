import 'package:dio/dio.dart';
import 'package:elsner_practical/network/rest_constants.dart';

class ApiClient {
  static final ApiClient _converter = ApiClient._internal();

  factory ApiClient() {
    return _converter;
  }

  ApiClient._internal();

  Dio dio() {
    var dio = Dio(
      BaseOptions(
          connectTimeout: 5000,
          receiveTimeout: 5000,
          contentType: "multipart/form-data",
          baseUrl: RestConstants.BASE_URL),
    );

    dio.interceptors.addAll(
      [
        LogInterceptor(
          error: true,
          requestHeader: false,
          requestBody: true,
          responseBody: true,
        ),
      ],
    );
    return dio;
  }
}
