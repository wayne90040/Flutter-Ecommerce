
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/size_config.dart';
import 'package:flutter_ecommerce/screen/splash/body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SizeConfig().init(context);  // Have to init Size Config
    return Scaffold(
      body: Body(),
    );
  }
}