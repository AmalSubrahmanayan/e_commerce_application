import 'dart:developer';

import 'package:e_commerce/constants/colors/app_colors.dart';
import 'package:e_commerce/model/otp/otp_arguement_model.dart';
import 'package:e_commerce/model/otp/otp_screen_enum.dart';
import 'package:e_commerce/model/signup_model/signup_model.dart';
import 'package:e_commerce/routes/route_names.dart';
import 'package:e_commerce/service/forgot_password_service.dart';
import 'package:e_commerce/service/opt_service.dart';
import 'package:e_commerce/utils/app_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpProvider with ChangeNotifier {
  signUp() {
    clearControllers();
  }

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobilenumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool hiddenPassword = true;
  bool loading = false;

  String? usernameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "please choose a username to use";
    } else if (value.length < 3) {
      return "To shot username. choose a username  with 4 or more characters";
    } else {
      return null;
    }
  }

  String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter correct email';
    } else {
      return null;
    }
  }

  String? mobilenumberValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your mobile number";
    } else if (value.length < 10) {
      return "Number must be 10 digits";
    } else {
      return null;
    }
  }

  String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "please enter your passwoed";
    } else if (value.length < 6) {
      return "To short password";
    } else {
      return null;
    }
  }

  String? confirmPasswordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "Please reenter your password";
    } else if (value != passwordController.text) {
      return "Password do not match";
    } else {
      return null;
    }
  }

  void clearControllers() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    // mobileNumberController.clear();
    // isNotVisible = true;
  }

  void togglePasswwordView() {
    hiddenPassword = !hiddenPassword;
    notifyListeners();
  }

  void toSignUpOtpScreen(context, FormState currentState) async {
    final SignUpModel model = SignUpModel(
      fullName: usernameController.text,
      email: emailController.text,
      number: mobilenumberController.text,
      password: passwordController.text,
    );
    final args = OtpArguementModel(
        model: model, checkScreen: OtpScreenEnum.signUpOtpScreen);
    if (currentState.validate()) {
      loading = true;
      notifyListeners();
      await ForgotPasswordService()
          .getUser(emailController.text)
          .then((value) async {
        if (value == null) {
          await OtpService().sendOtp(emailController.text).then((value) {
            log(value.toString());
            if (value != null) {
              Navigator.of(context)
                  .pushNamed(RouteNames.otpScreen, arguments: args)
                  .then((value) {
                loading = false;
                notifyListeners();
              });
            } else {
              return null;
            }
          });
        } else {
          AppToast.showToast('User already exists', AppColors.redColor);
        }
      });
      loading = false;
      notifyListeners();
    }
  }
}
