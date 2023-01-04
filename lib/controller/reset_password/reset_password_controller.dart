import 'dart:developer';

import 'package:e_commerce/routes/route_names.dart';
import 'package:e_commerce/service/forgot_password_service.dart';
import 'package:e_commerce/view/reset_password/widgets/success_dialogue.dart';
import 'package:flutter/material.dart';

class ResetPasswordProvider with ChangeNotifier {
  final TextEditingController resetPassworsdController =
      TextEditingController();
  final TextEditingController confirmPasswordConttrller =
      TextEditingController();
  bool isVisble = false;
  bool loading = false;

  void visibile() {
    isVisble = !isVisble;
    notifyListeners();
  }

  String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter new password';
    } else if (value.length < 6) {
      return 'Password too  short';
    } else {
      return null;
    }
  }

  String? confirmPasswordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please re-enter your password';
    } else if (value != resetPassworsdController.text) {
      return 'Password do not match';
    } else {
      return null;
    }
  }
  

  void success(context, email) {
    loading = true;
    notifyListeners();
    ForgotPasswordService()
        .changePassword(email, resetPassworsdController.text)
        .then(
      (value) {
        log(value.toString());
        if (value != null) {
          loading = false;
          notifyListeners();
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (ctx) {
              return const SuccessDialouge();
            },
          );
        } else {
          loading = false;
          notifyListeners();
        }
      },
    );
  }

  void toSignIn(context) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteNames.signin, (route) => false);
  }

  visibility() {}
}
