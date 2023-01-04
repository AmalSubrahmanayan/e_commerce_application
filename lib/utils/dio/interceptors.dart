import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/constants/api_endpoints.dart';
import 'package:e_commerce/constants/api_url.dart';
import 'package:e_commerce/utils/app_exceptions.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Interceptorapi {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Dio dio = Dio();

  Future<Dio> getApiUser() async {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await storage.read(key: 'token');
          dio.interceptors.clear();
          options.headers.addAll({"Authorization": "Bearer $token"});
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioError e, handler) async {
          if (e.response != null) {
            if (e.response?.statusCode == 403 &&
                e.response?.data['message'] == 'Forbidden') {
              log('token expired');
              RequestOptions requestOptions = e.requestOptions;
              try {
                final refreshToken = await storage.read(key: 'refreshToken');
                log('calling with refreshToken');
                final opts = Options(method: requestOptions.method);
                dio.options.headers["refresh"] = "Bearer $refreshToken";
                final Response response = await dio.get(
                  ApiUrl.apiUrl + ApiEndPoints.refreshToken,
                  options: opts,
                );
                if (response.statusCode! == 200) {
                  log('new token got');
                  log(response.data.toString());
                  final token = response.data['accessToken'];
                  storage.write(key: 'token', value: token);
                }
              } catch (e) {
                AppExceptions.errorHandler(e);
              }

              final token = await storage.read(key: 'token');
              final opts = Options(method: requestOptions.method);
              dio.options.headers["Authorization"] = "Bearer $token";
              final response = await dio.request(
                requestOptions.path,
                options: opts,
                cancelToken: requestOptions.cancelToken,
                onReceiveProgress: requestOptions.onReceiveProgress,
                data: requestOptions.data,
                queryParameters: requestOptions.queryParameters,
              );
              return handler.resolve(response);
            }
          } else {
            handler.next(e);
          }
        },
      ),
    );
    return dio;
  }
}
