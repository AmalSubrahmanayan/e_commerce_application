import 'package:flutter/material.dart';

class AppColors {
  static const bgColor = BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color.fromARGB(223, 17, 23, 82),
      Color.fromARGB(225, 0, 3, 20),
    ],
  ));
   static const transparentColor = Colors.transparent;
  static const whiteColor = Colors.white;
  static const greyColor = Colors.blueGrey;
  static const greenColor = Colors.green;
  static const redColor = Colors.red;
  static const buttonColor = Color(0xFF4c53A5);
  static const blueColor = Color.fromARGB(223, 3, 15, 82);
}
