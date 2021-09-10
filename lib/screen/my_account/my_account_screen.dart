
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screen/my_account/body.dart';

class MyAccountScreen extends StatelessWidget {

  static String routeName = "/my_account";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("My Account")
      ),
      body: Body(),
    );
  }
}