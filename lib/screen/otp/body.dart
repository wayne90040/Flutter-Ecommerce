

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/size_config.dart';
import 'package:flutter_ecommerce/widget/form_error.dart';

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
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text("OTP Verification", style: headingStyle),
              Text("We sent your code to +1 898 860 ***"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("This code will expired in "),
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 30.0, end: 0.0),
                    duration: Duration(seconds: 30),
                    builder: (_, value, child) {
                      return Text(
                        "00:${value.toInt()}",
                        style: TextStyle(color: kPrimaryColor),
                      );
                    },
                    onEnd: () {
                      // Do Something
                    },
                  ),
                ]
              ),
              OtpForm()
            ],
          ),
        ),
      )
    );
  }
}

class OtpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      child: Row(
        children: [
          SizedBox(
            width: getProportionateScreenWidth(60),
            child: TextFormField(
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
              decoration: optInputDecoration
            ),
          )
        ],
      ),
    );
  }

}