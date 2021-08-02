

import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce/screen/complete_profile/complete_profile_screen.dart';
import 'package:flutter_ecommerce/screen/forgot_password/forgot_password_screen.dart';
import 'package:flutter_ecommerce/screen/login_success/login_success_screen.dart';
import 'package:flutter_ecommerce/screen/sign_in/sign_in_screen.dart';
import 'package:flutter_ecommerce/screen/sign_up/sign_up_screen.dart';
import 'package:flutter_ecommerce/screen/sign_up_success_screen/sign_up_success.dart';
import 'package:flutter_ecommerce/screen/splash/splash_screen.dart';


final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  SignUpSuccessScreen.routeName: (context) => SignUpSuccessScreen()
};