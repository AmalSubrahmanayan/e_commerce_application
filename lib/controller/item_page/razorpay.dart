import 'package:flutter/cupertino.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentProvider with ChangeNotifier {
  Razorpay razorpay = Razorpay();

  void oninit() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {}

  void _handlePaymentError(PaymentFailureResponse response) {}

  void _handleExternalWallet(ExternalWalletResponse response) {}

  razorpayOption(int totalPrice) {
    var options = {
      'key': 'rzp_test_0dfRnQWOaIL1gb',
      'amount': totalPrice * 100, //in the smallest currency sub-unit.
      'name': 'Amal.',
      // 'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
      'description': 'Turf',
      'timeout': 300, // in seconds
      'prefill': {'contact': '9562666753', 'email': 'amalsubru@gmail.com'}
    };
    razorpay.open(options);
  }
}
