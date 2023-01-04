import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.obscureText,
    this.controller,
    this.decoration,
    this.hintText,
    this.iconData,
    this.validator,
    this.suffixicon,
    required this.autoFocus,
  });

  final bool obscureText;
  final TextEditingController? controller;
  final String? hintText;
  final IconData? iconData;
  final InputDecoration? decoration;
  final String? Function(String?)? validator;
  final Widget? suffixicon;
  final bool autoFocus;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(15),
        child: TextFormField(
          autofocus: autoFocus,
          obscureText: obscureText,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            suffixIcon: suffixicon,
            fillColor: Colors.grey[200],
            filled: true,
            prefixIcon: Icon(iconData),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            hintText: hintText,
          ),
          //hintText: hintText,
          // iconData: iconData,
        ),
      ),
    );
  }
}
