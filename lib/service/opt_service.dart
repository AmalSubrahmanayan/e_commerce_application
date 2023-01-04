import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/constants/api_queryparameters.dart';
import 'package:e_commerce/constants/api_url.dart';
import 'package:e_commerce/utils/app_exceptions.dart';

import '../constants/api_endpoints.dart';

class OtpService {
  final dio = Dio();
  Future<String?> verifyOtp(email, context, otpNumber) async {
    try {
      Response response =
          await dio.post(ApiUrl.apiUrl + ApiEndPoints.verifyOrSendOtp,
              data: {
                'otp': otpNumber,
                'email': email,
              },
              queryParameters: ApiQueryParameter.queryParameter);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return response.data['message'];
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    return null;
  }

  Future<String?> sendOtp( email) async {
    try {
      log('entered to send otp');
      Response response = await dio.get(
        ApiUrl.apiUrl + ApiEndPoints.verifyOrSendOtp,
        queryParameters: {
          'email': email,
        },
      );
      
      log(response.statusCode.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('entered create');
        return response.data['message'];
      }
    } catch (e) {
      log('entered catch');
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
