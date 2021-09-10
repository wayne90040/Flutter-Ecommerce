
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screen/my_account/body.dart';
import 'package:flutter_ecommerce/viewmodels/my_account_view_model.dart';
import 'package:provider/provider.dart';

class MyAccountScreen extends StatelessWidget {

  static String routeName = "/my_account";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return MyAccountViewModel();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Account")
        ),
        body: Body(),
      ),
    );
  }
}