import 'package:e_commerce/constants/colors/app_colors.dart';
import 'package:e_commerce/constants/colors/app_sizedboxes.dart';
import 'package:e_commerce/constants/colors/app_text_styles.dart';
import 'package:e_commerce/controller/sign_In/signin_controller.dart';
import 'package:e_commerce/constants/navigaotr/navigator_controller.dart';
import 'package:e_commerce/view/sign_in/widgets/forgot_pass.dart';
import 'package:e_commerce/view/sign_up/widgets/textfromfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppColors.bgColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(child: page(context)),
      ),
    );
  }

  Widget page(context) {
    final provider = Provider.of<SignInProvider>(context, listen: false);
    final formKey = GlobalKey<FormState>();
    // final signInProvider = Provider(() => SignInService());

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon(),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormFieldWidget(
                    hintText: "Email Id",
                    iconData: Icons.mail,
                    obscureText: false,
                    autoFocus: false,
                    controller: provider.emailController,
                    validator: (value) => provider.emailValidation(value),
                  ),
                  Consumer<SignInProvider>(
                    builder: (context, value, child) {
                      return TextFormFieldWidget(
                        autoFocus: false,
                        suffixicon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                              onTap: value.togglePasswordView,
                              child: value.hiddenPassword
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off)),
                        ),
                        hintText: "Password",
                        iconData: Icons.lock,
                        obscureText: value.hiddenPassword,
                        controller: provider.passwordController,
                        validator: (value) =>
                            provider.passwordValidation(value),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      forgotPass(context),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Consumer<SignInProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                      return ElevatedButton(
                        onPressed: () => value.login(context,formKey.currentState!),
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: AppColors.buttonColor,
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                            )),
                        child: const SizedBox(
                          // width: double.negativeInf,
                          width: 250,
                          child: Text(
                            "Sign in ",
                            textAlign: TextAlign.center,
                            style: AppTextStyles.textStyle1,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  extraText(),
                  AppSizedBoxes.sizedboxH20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      FloatingActionButton.extended(
                        onPressed: () => provider.googleSignin(context),
                        icon: Image.asset(
                          "assets/images/png-clipart-google-logo-google-logo-g-suite-chrome-text-logo.png",
                          height: 32,
                          width: 32,
                        ),
                        label: const Text(
                          ' Google ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        backgroundColor: AppColors.whiteColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  signUp(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget icon() {
    return Container(
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: Image.asset('assets/images/Group 137.png'));
  }

  Widget extraText() {
    return const Text(
      "Sign in with ",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 13,
        color: AppColors.whiteColor,
      ),
    );
  }

  Widget signUp(context) {
    return TextButton(
        onPressed: () {
          signUpPageNav(context);
        },
        child: const Text(
          "Create new account",
          style: TextStyle(fontSize: 15),
        ));
  }
}
 
