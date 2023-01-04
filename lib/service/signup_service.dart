import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce/constants/api_endpoints.dart';
import 'package:e_commerce/model/signup_model/signup_model.dart';
import 'package:e_commerce/model/signup_model/signup_token_model.dart';

import 'package:e_commerce/utils/app_exceptions.dart';

import '../constants/api_url.dart';

class SignUpService {
  final dio = Dio();
  Future<SignUpTokenModel?> signUp(SignUpModel model, context) async {
    try {
      Response response = await dio.post(ApiUrl.apiUrl + ApiEndPoints.signUp,
          data: jsonEncode(model.toJson()),
          queryParameters: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          });
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('saved to database');
        final SignUpTokenModel model =
            SignUpTokenModel.fromJson(response.data!);
        return model;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
