

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screen/complete_profile/body.dart';
import 'package:flutter_ecommerce/viewmodels/complete_profile_view_model.dart';
import 'package:provider/provider.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile_screen";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return CompleteProfileViewModel();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Complete Profile"),
        ),
        body: Body(),
      ),
    );
  }
}