import 'package:e_commerce/controller/bottom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:e_commerce/controller/cart/cart_controller.dart';
import 'package:e_commerce/controller/home/home_controller.dart';
import 'package:e_commerce/controller/item_page/item_page_controller.dart';
import 'package:e_commerce/controller/item_page/razorpay.dart';
import 'package:e_commerce/controller/otp/otp_screen_controller.dart';
import 'package:e_commerce/controller/reset_password/reset_password_controller.dart';
import 'package:e_commerce/controller/sign_In/signin_controller.dart';
import 'package:e_commerce/controller/sign_up/signup_controller.dart';
import 'package:e_commerce/controller/splash/splach_controller.dart';
import 'package:e_commerce/controller/wishlist/wishlist_controller.dart';
import 'package:e_commerce/routes/route_functions.dart';
import 'package:e_commerce/view/bottom_nav/bottom_nav.dart';
import 'package:e_commerce/view/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/forgot_password/forgot_password_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => SplashController())),
        ChangeNotifierProvider(create: ((context) => SignUpProvider())),
        ChangeNotifierProvider(create: ((context) => SignInProvider())),
        ChangeNotifierProvider(create: ((context) => ForgotPasswordProvider())),
        ChangeNotifierProvider(create: (context) => ResetPasswordProvider()),
        ChangeNotifierProvider(create: ((context) => BottomNavBarProvider())),
        ChangeNotifierProvider(create: ((context) => OtpScreenProvider())),
        ChangeNotifierProvider(create: ((context) => HomeProvider())),
        ChangeNotifierProvider(create: ((context) => ItemProvider())),
        ChangeNotifierProvider(create: ((context) => PaymentProvider())),
        ChangeNotifierProvider(create: ((context) => CartProvider())),
        ChangeNotifierProvider(create: ((context) => WishListProvider())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        debugShowCheckedModeBanner: false,
        home:  const SplashScreen(),
        onGenerateRoute: (settings) => AppRoutes.generateRoute(settings),
      ),
    );
  }
}
