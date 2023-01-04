import 'package:e_commerce/constants/colors/app_colors.dart';
import 'package:e_commerce/constants/colors/app_sizedboxes.dart';
import 'package:e_commerce/controller/reset_password/reset_password_controller.dart';
import 'package:e_commerce/model/signup_model/signup_model.dart';
import 'package:e_commerce/utils/loading_widget.dart';
import 'package:e_commerce/view/reset_password/widgets/customtext_formfield.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({
    super.key,
    required this.model,
  });
  final SignUpModel model;
  @override
  Widget build(BuildContext context) {
    final ResetPasswordProvider resetPasswordProvider =
        Provider.of<ResetPasswordProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: AppColors.bgColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                iconSize: 50,
                icon: const Icon(Icons.keyboard_arrow_left_outlined),
                color: const Color.fromARGB(255, 255, 255, 255),
                onPressed: () {
                  Navigator.pop(context);
                }),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Enter New Password",
                    style: TextStyle(color: AppColors.whiteColor, fontSize: 35),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Text(
                  //   "Welcome Back",
                  //   style: TextStyle(color: AppColors.whiteColor, fontSize: 20),
                  // )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Lottie.asset('assets/images/forgot password.json',
                            height: 250, width: 250),
                        Consumer<ResetPasswordProvider>(
                            builder: (context, values, _) {
                          return CustomTextFormfield(
                            controller: values.resetPassworsdController,
                            keyboardType: TextInputType.text,
                            action: TextInputAction.next,
                            icon: Icons.lock,
                            hint: 'New Password',
                            obscure: values.isVisble == false ? true : false,
                            validator: (value) =>
                                values.passwordValidation(value),
                            suffixIcon: values.isVisble == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                            suffixOntap: () => values.visibility(),
                            autoFocus: true,
                          );
                        }),
                        AppSizedBoxes.sizedboxH10,
                        CustomTextFormfield(
                          controller:
                              resetPasswordProvider.confirmPasswordConttrller,
                          keyboardType: TextInputType.text,
                          action: TextInputAction.done,
                          icon: Icons.lock,
                          hint: 'Confirm password',
                          obscure: false,
                          validator: (value) => resetPasswordProvider
                              .confirmPasswordValidation(value),
                          autoFocus: true,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Consumer<ResetPasswordProvider>(
                            builder: (context, values, _) {
                          return values.loading == true
                              ? const LoadingWidget()
                              : ElevatedButton(
                                  onPressed: () =>
                                      values.success(context, model.email),
                                  style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder(),
                                      backgroundColor: AppColors.buttonColor,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20,
                                      )),
                                  child: const SizedBox(
                                    width: 250,
                                    child: Text(
                                      "Done",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColors.whiteColor),
                                    ),
                                  ),
                                );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
