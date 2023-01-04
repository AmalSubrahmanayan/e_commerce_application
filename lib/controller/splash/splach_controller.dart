import 'dart:developer';

import 'package:e_commerce/routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashController with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? onboardValue;
  String? signInValue;

  void splash(context) async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    onboardValue = await storage.read(key: 'onboard');
    signInValue = await storage.read(key: 'token');
    log(signInValue.toString());
    if (signInValue != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, RouteNames.bottomNavBar, (route) => false);
    } else if (onboardValue != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, RouteNames.signin, (route) => false);
    }
  }
}
