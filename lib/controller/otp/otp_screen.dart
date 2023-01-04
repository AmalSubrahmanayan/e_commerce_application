import 'dart:async';
import 'dart:developer';

import 'package:e_commerce/constants/colors/app_colors.dart';
import 'package:e_commerce/model/otp/otp_screen_enum.dart';
import 'package:e_commerce/model/signup_model/signup_model.dart';
import 'package:e_commerce/routes/route_names.dart';
import 'package:e_commerce/service/opt_service.dart';
import 'package:e_commerce/service/signup_service.dart';
import 'package:e_commerce/utils/app_toast.dart';
import 'package:e_commerce/view/reset_password/reset_password.dart';
import 'package:flutter/cupertino.dart';

class OtpScreenProvider with ChangeNotifier {
  int timeRemaining = 60;
  Timer? timer;
  bool enableResend = false;
  bool clear = false;
  String code = '';
  bool loading = false;

  void setResendVisibility(bool newValue, context, email)  {
     OtpService().sendOtp(email).then((value) {
      if (value != null) {
        enableResend = newValue;
        timeRemaining = 60;
        clear = true;
        notifyListeners();
      } else {
        return null;
      }
    });
  }

  void setCode(String newCode) {
    code = newCode;
    notifyListeners();
  }

  void verifyOtpCode(
      context, SignUpModel model, OtpScreenEnum screenChek) async {
        log("verifyOtpCode 1");
    // log(model.toString());
    // log(screenChek.toString());
    if (code.length != 4) {
      AppToast.showToast('Please enter OTP', AppColors.redColor);
    } else {
      if (timeRemaining == 0) {
        AppToast.showToast('Otp timedout', AppColors.redColor);
      } else {
        loading = true;
        notifyListeners();
        if (screenChek == OtpScreenEnum.forgotOtpScreen) {
         
          await OtpService()
              .verifyOtp(model.email, context,code )
              .then((value) {
            log('get the value');
            if (value != null) {
              final args = ResetPassword(model: model);
              Navigator.of(context)
                  .pushReplacementNamed(RouteNames.resetPassword,
                      arguments: args)
                  .then((value) {
                loading = false;
                notifyListeners();
              });
            } else {
              null;
              loading = false;
              notifyListeners();
            }
          });
        } else if (screenChek == OtpScreenEnum.signUpOtpScreen) {
           log('signup otp screen check');
          await OtpService()
              .verifyOtp(model.email, context,code )
              .then((value) {
            if (value != null) {
              SignUpService().signUp(model, context).then((value) {
                if (value != null) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteNames.bottomNavBar, (route) => false);
                  loading = false;
                  notifyListeners();
                } else {
                  loading = false;
                  notifyListeners();
                }
              });
            } else {
              null;
              loading = false;
              notifyListeners();
            }
          });
        }
      }
    }
  }

  void changeTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (timeRemaining != 0) {
        timeRemaining--;
        notifyListeners();
      } else {
        enableResend = true;
        notifyListeners();
      }
    });
  }
}
