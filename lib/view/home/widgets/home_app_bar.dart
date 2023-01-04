import 'package:badges/badges.dart';
import 'package:e_commerce/constants/colors/app_colors.dart';
import 'package:e_commerce/view/cart/cart.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      // color: Colors.white,
      decoration: AppColors.bgColor,
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
        
          const Icon(
            Icons.sort,
            size: 30,
            color: AppColors.whiteColor,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
            ),
            child: Text(
              "CLONER",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor),
            ),
          ),
          const Spacer(),
          Badge(
            badgeColor: AppColors.redColor,
            padding: const EdgeInsets.all(6),
            badgeContent: const Text(
              "3",
              style: TextStyle(color: AppColors.whiteColor),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Cart()));
              },
              child: const Icon(
                Icons.shopping_bag_rounded,
                size: 32,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
