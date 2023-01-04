import 'dart:developer';

import 'package:e_commerce/constants/colors/app_colors.dart';
import 'package:e_commerce/constants/colors/app_sizedboxes.dart';
import 'package:e_commerce/controller/otp/otp_screen_controller.dart';
import 'package:e_commerce/controller/sign_up/signup_controller.dart';
import 'package:e_commerce/model/otp/otp_screen_enum.dart';
import 'package:e_commerce/model/signup_model/signup_model.dart';
import 'package:e_commerce/utils/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
    required this.model,
    required this.screenChecking,
  });

  final SignUpModel? model;
  final OtpScreenEnum? screenChecking;

  @override
  State<OtpScreen> createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen> {
  late SignUpProvider signUpprovider;
  late OtpScreenProvider otpProvider;
  @override
  void initState() {
    otpProvider = Provider.of<OtpScreenProvider>(context, listen: false);
    otpProvider.changeTimer();
    otpProvider.timeRemaining = 60;
    log('model:${widget.model.toString()}');
    log('screen:${widget.screenChecking.toString()}');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppColors.bgColor,
        height: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  AppSizedBoxes.sizedboxH60,
                  Center(
                    child: Image.asset(
                      "assets/images/Group 137.png",
                    ),
                  ),
                  AppSizedBoxes.sizedboxH60,
                  const Text(
                    "OTP Verification",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  AppSizedBoxes.sizedboxH20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Enter your OTP",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  AppSizedBoxes.sizedboxH60,
                  Consumer<OtpScreenProvider>(
                    builder: (context, values, _) {
                      return OtpTextField(
                        numberOfFields: 4,
                        showFieldAsBox: true,
                        filled: true,
                        fieldWidth: 60,
                        borderRadius: BorderRadius.circular(18),
                        autoFocus: true,
                        disabledBorderColor: AppColors.transparentColor,
                        clearText: values.clear,
                        onSubmit: (String code) => values.setCode(code),
                      );
                    },
                  ),
                  AppSizedBoxes.sizedboxH20,
                  Consumer<OtpScreenProvider>(
                    builder: (context, values, _) {
                      return values.loading == true
                          ? const LoadingWidget()
                          : ElevatedButton(
                              onPressed: () => values.verifyOtpCode(context,
                                  widget.model!, widget.screenChecking!),
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: AppColors.buttonColor,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                  )),
                              child: const SizedBox(
                                width: 250,
                                child: Text(
                                  "Verify",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            );
                    },
                  ),
                  AppSizedBoxes.sizedboxH10,
                  Consumer<OtpScreenProvider>(
                    builder: (context, values, _) {
                      return values.timeRemaining != 0
                          ? Text(
                              "Didn't recieve code ?${values.timeRemaining}",
                              style: const TextStyle(
                                color: AppColors.whiteColor,
                              ),
                            )
                          : TextButton(
                              onPressed: () {
                                return values.setResendVisibility(
                                    true, context, widget.model!.email);
                              },
                              child: const Text("Resent"),
                            );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
