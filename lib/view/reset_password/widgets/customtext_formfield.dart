import 'package:e_commerce/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormfield extends StatelessWidget {
  const CustomTextFormfield({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.action,
    required this.icon,
    required this.hint,
    required this.obscure,
    required this.validator,
    required this.autoFocus,
    this.suffixOntap,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction action;
  final IconData icon;
  final String hint;
  final bool obscure;
  final String? Function(String?)? validator;
  final void Function()? suffixOntap;
  final IconData? suffixIcon;
  final bool autoFocus;
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus,
      keyboardType: keyboardType,
      textInputAction: action,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        fillColor: AppColors.whiteColor,
        filled: true,
        prefixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
        // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: obscure == true
            ? IconButton(
                onPressed: suffixOntap,
                icon: Icon(
                  suffixIcon,
                  color: Colors.grey,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      obscureText: obscure,
    );
  }
}
