import 'package:e_commerce/constants/colors/app_colors.dart';
import 'package:e_commerce/constants/colors/app_sizedboxes.dart';
import 'package:e_commerce/view/sign_up/widgets/text.dart';
import 'package:e_commerce/view/sign_up/widgets/textfromfield.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: const Color.fromARGB(223, 3, 15, 82),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                        // bottomEnd: Radius.circular(60),
                        bottomStart: Radius.circular(80),
                      ),
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
                            "Profile",
                            style: TextStyle(
                              color: AppColors.blueColor,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          AppSizedBoxes.sizedboxH20,
                          Lottie.asset(
                            'assets/images/profile.json',
                            width: double.infinity,
                            height: 190,
                          ),
                          AppSizedBoxes.sizedboxH10,
                          const Text(
                            "Amal Subrahmanyan",
                            style: TextStyle(
                              color: AppColors.blueColor,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          extraText(),
                        ],
                      ),
                    ),
                  ),
                  AppSizedBoxes.sizedboxH10,
                  const TextFormFieldWidget(
                    hintText: "Email Id",
                    iconData: Icons.mail,
                    obscureText: false,
                    autoFocus: false,
                  ),
                  const TextFormFieldWidget(
                    hintText: "Mobile Number",
                    iconData: Icons.phone,
                    obscureText: false,
                    autoFocus: false,
                  ),
                  Container(
                    height: 50,
                    margin: const EdgeInsets.all(20),
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        // provider.toSignUpOtpScreen(
                        //     context, formKey.currentState!);
                        // homePageNavigator(context, formKey);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: AppColors.buttonColor,
                      ),
                      child: const SizedBox(
                        child: Text(
                          "Ok ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
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
