import 'package:e_commerce/model/otp/otp_screen_enum.dart';
import 'package:e_commerce/model/signup_model/signup_model.dart';

class OtpArguementModel {
  final SignUpModel model;
  final OtpScreenEnum checkScreen;
  OtpArguementModel({
    required this.model,
    required this.checkScreen,
  });
}
