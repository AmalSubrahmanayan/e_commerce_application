import 'package:e_commerce/view/forgotPassword/forgot_password.dart';
import 'package:flutter/material.dart';

Widget forgotPass(context) {
  return TextButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  ForgotPassword()));
      },
      child: const Text(
        "Forgit Password?",
      ));
  // return const Text(
  //   "Forgit Password?",
  //   textAlign: TextAlign.center,
  //   style: TextStyle(fontSize: 14, color: Colors.black),
  // );
}
