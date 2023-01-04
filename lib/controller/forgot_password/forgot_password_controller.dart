import 'dart:developer';

import 'package:e_commerce/constants/colors/app_colors.dart';
import 'package:e_commerce/model/otp/otp_arguement_model.dart';
import 'package:e_commerce/model/otp/otp_screen_enum.dart';
import 'package:e_commerce/routes/route_names.dart';
import 'package:e_commerce/service/forgot_password_service.dart';
import 'package:e_commerce/service/opt_service.dart';
import 'package:e_commerce/utils/app_toast.dart';
import 'package:flutter/material.dart';

class ForgotPasswordProvider with ChangeNotifier {
  bool loading = false;
  final TextEditingController findAccountController = TextEditingController();

  void toOtpScreen(context, FormState currentState) {
    if (currentState.validate()) {
      log('forgot password');
      loading = true;
      notifyListeners();
      ForgotPasswordService().getUser(findAccountController.text).then((model) {
        log("otp forgot password");
        if (model != null) {
          log('model!=null');
          OtpService().sendOtp(model.email!).then((value) {
            log("forgot otp sent");
            if (value != null) {
              final args = OtpArguementModel(
                  model: model, checkScreen: OtpScreenEnum.forgotOtpScreen);
              Navigator.of(context).pushNamed(
                RouteNames.otpScreen,
                arguments: args,
              );
              loading = false;
              notifyListeners();
            } else {
              log('no user');
              loading = false;
              notifyListeners();
              AppToast.showToast('No user Found', AppColors.redColor);
            }
          });
        }else{
          log("enterd else");
        }
      });
    }
  }
}

String? findAccountTextfieldValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email address';
  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return 'Please enter correct email';
  } else {
    return null;
  }
}


