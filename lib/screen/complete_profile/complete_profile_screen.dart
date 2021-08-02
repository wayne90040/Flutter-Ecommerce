

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screen/complete_profile/body.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile_screen";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Complete Profile"),
      ),
      body: Body(),
    );
  }
}