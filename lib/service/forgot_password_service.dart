import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/constants/api_endpoints.dart';
import 'package:e_commerce/constants/api_queryparameters.dart';
import 'package:e_commerce/constants/api_url.dart';
import 'package:e_commerce/model/signup_model/signup_model.dart';
import 'package:e_commerce/utils/app_exceptions.dart';

class ForgotPasswordService {
  final dio = Dio();
  Future<SignUpModel?> getUser(String email) async {  
    try {
      Response response = await dio.get(
        ApiUrl.apiUrl + ApiEndPoints.usercheck,
        queryParameters: {
          'email': email,
        },
      );
      // print(email.toString());
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        log('got user');
        final SignUpModel model = SignUpModel.fromJson(response.data!);
        return model;
      } else if (response.statusCode == 201) {
        log('No user found');
        return null;
      }
    } catch (e) {
      log('entered catch');   
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<String?> changePassword(email, newPassword) async {
    try {
      log('entered changepassword function');
      Response<dynamic> response = await dio.post(
        ApiUrl.apiUrl + ApiEndPoints.forgetPassword,
        data: {
          'email': email,
          'password': newPassword,
        },
        queryParameters: ApiQueryParameter.queryParameter,
      );
      log(response.statusCode.toString());
      if (response.statusCode == 202) {
        log('Password changed successfull');
        return response.data['message'];
      }
    } catch (e) {
      log('entered catch');
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
