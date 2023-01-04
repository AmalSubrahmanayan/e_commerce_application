import 'package:e_commerce/constants/colors/app_colors.dart';
import 'package:e_commerce/controller/forgot_password/forgot_password_controller.dart';
import 'package:e_commerce/view/sign_up/widgets/textfromfield.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<ForgotPasswordProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        decoration: AppColors.bgColor,
        child: Form(
          key: formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  IconButton(
                      iconSize: 50,
                      icon: const Icon(Icons.keyboard_arrow_left_outlined),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      onPressed: () {
                        Navigator.pop(context);
                        // Navigator.pop(context,
                        //     MaterialPageRoute(builder: (context) => const SignIn()));
                      }),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Forgot Password",
                      style:
                          TextStyle(color: AppColors.whiteColor, fontSize: 35),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Welcome Back",
                      style:
                          TextStyle(color: AppColors.whiteColor, fontSize: 20),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 680,
                decoration: const BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Lottie.asset('assets/images/forgotpassword2.json',
                          height: 200, width: 200),
                      TextFormFieldWidget(
                        hintText: "Email Id",
                        iconData: Icons.mail,
                        obscureText: false,
                        autoFocus: true,
                        controller: provider.findAccountController,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Consumer<ForgotPasswordProvider>(
                        builder: (context, values, _) {
                          return ElevatedButton(
                            onPressed: () => values.toOtpScreen(
                                context, formKey.currentState!),
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: AppColors.buttonColor,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                )),
                            child: const SizedBox(
                              width: 250,
                              child: Text(
                                "Send a code ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, color: AppColors.whiteColor),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
