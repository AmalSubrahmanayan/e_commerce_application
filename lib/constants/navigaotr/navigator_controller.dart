import 'package:e_commerce/routes/route_names.dart';
import 'package:flutter/material.dart';

void signUpPageNav(context) {
  Navigator.of(context).pushNamed( RouteNames.signup);
}

void otpScreenProvider(context) {
  Navigator.of(context).pushNamedAndRemoveUntil(RouteNames.otpScreen, (route) => false);
}


void profile(context) {
  Navigator.of(context).pushNamed( RouteNames.profile,);
}

