

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce/enums.dart';
import 'package:flutter_ecommerce/screen/home/body.dart';
import 'package:flutter_ecommerce/screen/profile/custom_bottom_nav_bar.dart';
import 'package:flutter_ecommerce/viewmodels/home_view_model.dart';
import 'package:provider/provider.dart';

import '../../size_config.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SizeConfig().init(context);
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return HomeViewModel();
      },
      child: Scaffold(
        body: Body(),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      ),
    );
  }
}