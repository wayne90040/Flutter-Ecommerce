

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce/enums.dart';
import 'package:flutter_ecommerce/screen/home/body.dart';
import 'package:flutter_ecommerce/screen/profile/custom_bottom_nav_bar.dart';
import 'package:flutter_ecommerce/screen/profile/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}