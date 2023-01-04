import 'dart:developer';

import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayService {
  void openRazorPay(Razorpay razorPay, options) {
    try {
      razorPay.open(options);
    } catch (e) {
      log(e.toString());
    }
  }
}
// Footer
// © 2022 GitHub, Inc.
// Footer navigation
// Terms
