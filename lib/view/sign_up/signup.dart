import 'package:e_commerce/constants/colors/app_colors.dart';
import 'package:e_commerce/controller/sign_up/signup_controller.dart';
import 'package:e_commerce/view/sign_up/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/textfromfield.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignUpProvider>(context, listen: false);
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(223, 3, 15, 82),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     IconButton(
                //         iconSize: 50,
                //         icon: const Icon(Icons.keyboard_arrow_left_outlined),
                //         color: const Color.fromARGB(255, 255, 255, 255),
                //         onPressed: () {
                //           // Navigator.pop(context);
                //           Navigator.pop(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => const SignIn()));
                //         }),
                //   ],
                // ),
                Container(
                  decoration: AppColors.bgColor,
                  width: double.infinity,
                  child: Image.asset('assets/images/Group 137.png'),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(50),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.minimize,
                          color: AppColors.buttonColor,
                        ),
                        const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: AppColors.blueColor,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextFormFieldWidget(
                          hintText: "User Name",
                          iconData: Icons.person,
                          obscureText: false,
                          autoFocus: false,
                          controller: provider.usernameController,
                          validator: (value) =>
                              provider.usernameValidation(value),
                        ),
                        TextFormFieldWidget(
                          hintText: "Email Id",
                          iconData: Icons.mail,
                          obscureText: false,
                          autoFocus: false,
                          controller: provider.emailController,
                          validator: (value) => provider.emailValidation(value),
                        ),
                        TextFormFieldWidget(
                          hintText: "Mobile Number",
                          iconData: Icons.phone,
                          obscureText: false,
                          autoFocus: false,
                          controller: provider.mobilenumberController,
                          validator: (value) =>
                              provider.mobilenumberValidation(value),
                        ),
                        Consumer<SignUpProvider>(
                            builder: (context, value, child) {
                          return TextFormFieldWidget(
                            suffixicon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: value.togglePasswwordView,
                                child: value.hiddenPassword
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                              ),
                            ),
                            autoFocus: false,
                            hintText: "Password",
                            iconData: Icons.lock,
                            obscureText: value.hiddenPassword,
                            controller: provider.passwordController,
                            validator: (value) =>
                                provider.passwordValidation(value),
                          );
                        }),
                        TextFormFieldWidget(
                          hintText: "Confirm Password",
                          iconData: Icons.lock,
                          obscureText: true,
                          autoFocus: false,
                          controller: provider.confirmPasswordController,
                          validator: (value) =>
                              provider.confirmPasswordValidation(value),
                        ),
                        Container(
                          height: 50,
                          margin: const EdgeInsets.all(20),
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              provider.toSignUpOtpScreen(
                                  context, formKey.currentState!);
                              // homePageNavigator(context, formKey);
                            },
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: AppColors.buttonColor,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                )),
                            child: const SizedBox(
                              width: 250,
                              child: Text(
                                "Sign Up ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        extraText(),
                        // Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // children: [
                            // SignInButton(
                            //   Buttons.Email,
                            //   mini: true,
                            //   onPressed: () {},
                            // ),
                            // SignInButton(
                            //   Buttons.Facebook,
                            //   mini: true,
                            //   onPressed: () {},
                            // ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
