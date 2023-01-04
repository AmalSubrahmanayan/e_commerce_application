import 'package:e_commerce/constants/colors/app_colors.dart';
import 'package:e_commerce/constants/navigaotr/navigator_controller.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ListWidgets extends StatelessWidget {
   ListWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ListTile(
            onTap: () async {
              await Share.share('link');
            },
            leading: const Icon(
              Icons.share_outlined,
              color: AppColors.whiteColor,
              size: 25,
            ),
            title: const Text(
              'Share',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 20,
              ),
            ),
          ),
          //2
          ListTile(
            onTap: () async {
              if (await launch("mailto:amalsubru@gmail.com")) {
                throw "Try Again";
              }
            },
            leading: const Icon(
              Icons.feedback_outlined,
              color: AppColors.whiteColor,
              size: 25,
            ),
            title: const Text(
              'Feed Back',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 20,
              ),
            ),
            
          ),
          //3
          ListTile(
            onTap: () {
              _launchUrl();
            },
            leading: const Icon(
              Icons.attribution_outlined,
              color: AppColors.whiteColor,
              size: 26,
            ),
            title: const Text(
              'About Developer',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 20,
              ),
            ),
          ),
          //4
          ListTile(
            onTap: () {
              profile(context);
            },
            leading: const Icon(
              Icons.person_outlined,
              color: AppColors.whiteColor,
              size: 25,
            ),
            title: const Text(
              'Profile',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 20,
              ),
            ),
          ),
          //5
          const ListTile(
            leading: Icon(
              Icons.shopping_bag_outlined,
              color: AppColors.whiteColor,
              size: 25,
            ),
            title: Text(
              'Order',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 20,
              ),
            ),
          ),
          //6
          const ListTile(
            leading: Icon(
              Icons.location_on_outlined,
              color: AppColors.whiteColor,
              size: 25,
            ),
            title: Text(
              'Address',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          Column(
            children: const [
              Text(
                "V 1.0.0",
                style: TextStyle(color: AppColors.whiteColor),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  final Uri _url = Uri.parse('https://amalsubrahmanayan.github.io/PORTFOLIO/');
}
