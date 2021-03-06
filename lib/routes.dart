

import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce/screen/cart/cart_screen.dart';
import 'package:flutter_ecommerce/screen/complete_profile/complete_profile_screen.dart';
import 'package:flutter_ecommerce/screen/forgot_password/forgot_password_screen.dart';
import 'package:flutter_ecommerce/screen/help_center/help_center_screen.dart';
import 'package:flutter_ecommerce/screen/help_center/problem_webview_screen.dart';
import 'package:flutter_ecommerce/screen/home/home_screen.dart';
import 'package:flutter_ecommerce/screen/login_success/login_success_screen.dart';
import 'package:flutter_ecommerce/screen/main_screen.dart';
import 'package:flutter_ecommerce/screen/message/message_screen.dart';
import 'package:flutter_ecommerce/screen/my_account/my_account_screen.dart';
import 'package:flutter_ecommerce/screen/notification/notification_screen.dart';
import 'package:flutter_ecommerce/screen/otp/otp_screen.dart';
import 'package:flutter_ecommerce/screen/product_detail/product_detail_screen.dart';
import 'package:flutter_ecommerce/screen/profile/profile_screen.dart';
import 'package:flutter_ecommerce/screen/setting/setting_screen.dart';
import 'package:flutter_ecommerce/screen/sign_in/sign_in_screen.dart';
import 'package:flutter_ecommerce/screen/sign_up/sign_up_screen.dart';
import 'package:flutter_ecommerce/screen/splash/splash_screen.dart';


final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  MyAccountScreen.routeName: (context) => MyAccountScreen(),
  MainScreen.routeName: (context) => MainScreen(),
  MessageScreen.routeName: (context) => MessageScreen(),
  SettingScreen.routeName: (context) => SettingScreen(),
  HelpCenterScreen.routeName: (context) => HelpCenterScreen(),
  NotificationScreen.routeName: (context) => NotificationScreen(),
  ProblemWebViewScreen.routeName: (context) => ProblemWebViewScreen()
};
