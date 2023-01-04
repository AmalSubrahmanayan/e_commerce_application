import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce/constants/api_endpoints.dart';
import 'package:e_commerce/constants/api_queryparameters.dart';
import 'package:e_commerce/constants/api_url.dart';
import 'package:e_commerce/model/signin_model/signin_token_model.dart';

import 'package:e_commerce/model/signin_model/signin_model.dart';
import 'package:e_commerce/utils/app_exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInService {
  final dio = Dio();

  Future<SigninTokenModel?> loginservice(SignInModel model) async {
    try {
      // log('entered login fn');
      Response response = await dio.post(ApiUrl.apiUrl + ApiEndPoints.login,
          queryParameters: ApiQueryParameter.queryParameter,
          // data: model.toJson(),
          data: jsonEncode(model.toJson()));
      // print(response.statusCode.toString());

      // log(response.statusCode.toString());
      if (response.statusCode == 200) {
        // log('try');
        final SigninTokenModel model = SigninTokenModel.fromJson(response.data!);
        log(response.data.toString());
        return model;
      }
    } catch (e) {
      AppExceptions.errorHandler(e);
    }
    // log("message");
    return null;
  }

  Future<String?> googleSignIn(GoogleSignIn googleSignIn) async {
    try {
      final result = await googleSignIn.signIn();
      Response response =
          await dio.post(ApiUrl.apiUrl + ApiEndPoints.googleSignIn, data: {
        'email': result?.email,
        'name': result?.displayName,
      });
      // log(response.statusCode.toString());
      if (response.statusCode == 201) {
        return response.data['message'];
      }
    } catch (e) {
      log('entered catch of googlesignin');
      AppExceptions.errorHandler(e);
    }
    return null;
  }
}
