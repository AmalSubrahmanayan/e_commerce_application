import 'package:e_commerce/constants/colors/app_colors.dart';
import 'package:e_commerce/constants/colors/app_sizedboxes.dart';
import 'package:e_commerce/controller/reset_password/reset_password_controller.dart';
import 'package:e_commerce/utils/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuccessDialouge extends StatelessWidget {
  const SuccessDialouge({super.key});
  @override
  Widget build(BuildContext context) {
    final newPasswordProvider =
        Provider.of<ResetPasswordProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      newPasswordProvider.toSignIn(context);
    });
    return Dialog(
      backgroundColor: AppColors.transparentColor,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.blueColor,
          ),
          width: 300,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage('assets/images/Group 137.png'),
              ),
              Text(
                'Success',
                style: TextStyle(
                  color: AppColors.greenColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              AppSizedBoxes.sizedboxH10,
              Text(
                'You will be redirected to the\nHome page in a\nfew seconds',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              AppSizedBoxes.sizedboxH10,
              LoadingWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
