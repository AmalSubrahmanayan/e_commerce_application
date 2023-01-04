import 'package:e_commerce/constants/colors/app_colors.dart';
import 'package:e_commerce/controller/bottom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:e_commerce/view/account/accpunt.dart';
import 'package:e_commerce/view/wishlist/wishlist.dart';

import 'package:e_commerce/view/home/home.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
   BottomNavBar({super.key});

  final List<dynamic> body =  [
    const Home(),
    
    const Wishlist(),
    const Account(),
    // MenuItem(),
  ];
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BottomNavBarProvider>(context);
    int curentbodyindex = controller.currentIndexsearch();
    return Scaffold(
      body: body[curentbodyindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: curentbodyindex,
        type: BottomNavigationBarType.fixed,
        onTap: ((value) => controller.newIndex(value)),
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              (curentbodyindex == 0) ? Icons.home : Icons.home_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Favorite',
            icon: Icon(
              (curentbodyindex == 1) ? Icons.favorite : Icons.favorite_border,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(
              (curentbodyindex == 2) ? Icons.person : Icons.person_outline,
            ),
          ),
          
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     (curentbodyindex == 3) ? Icons.menu : Icons.menu_outlined,
          //   ),
          //   label: 'Menu',
          // ),
        ],
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.blueColor,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
