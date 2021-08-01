

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/screen/sign_up/sign_up_form.dart';
import 'package:flutter_ecommerce/size_config.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              Text("Register Account", style: headingStyle),
              Text(
                "Complete your details or continue \nwith social media",
                textAlign:TextAlign.center,
              ),
              SignUpForm()
            ],
          ),
        ),
      ),
    );
  }
}



