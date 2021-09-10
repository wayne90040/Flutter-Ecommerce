

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/enums.dart';
import 'package:flutter_ecommerce/screen/profile/body.dart';
import 'package:flutter_ecommerce/viewmodels/profile_menu_view_model.dart';
import 'package:provider/provider.dart';


class ProfileScreen extends StatelessWidget {

  static String routeName = "/profile";

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return ProfileMenuViewModel();
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Profile")),
        body: Body(),
        // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
      ),
    );
  }
}

