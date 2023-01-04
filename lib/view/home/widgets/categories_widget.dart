
import 'package:e_commerce/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
    required this.imagepath,
    required this.text,
    required this.ontap,
    // required this.price,
    // required this.offer,
  });
  final String imagepath;
  final String text;
  // final String price;
  // final String offer;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                Image(
                  image: NetworkImage(imagepath),
                  width: 40,
                  height: 40,
                ),
                Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: AppColors.blueColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
