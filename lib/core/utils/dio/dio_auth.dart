import 'package:app_store/core/utils/constants_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "contentType";
const String AUTHORIZATION = "Authorization";
const String Default_LANGUAGE = "lang";

class DioAuth{
  late Dio dio;

  init() async {
    dio = Dio();

    Map<String,String> headers={
      CONTENT_TYPE:APPLICATION_JSON,
      Default_LANGUAGE: 'en',
    };
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
      receiveDataWhenStatusError: true,
    );

    if(!kReleaseMode)
    {
      dio.interceptors.add(PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true
      ));
    }

    return dio;
  }

}