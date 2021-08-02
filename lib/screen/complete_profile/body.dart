

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/size_config.dart';
import 'package:flutter_ecommerce/widget/custom_surffix_icon.dart';
import 'package:flutter_ecommerce/widget/default_button.dart';

import '../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            Text("Complete Profile", style: headingStyle),
            Text(
              "Complete your details or continue  \nwith social media",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.06),
            CompleteProfileForm()
          ],
        ),
      ),
    );
  }
}

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  late String firstName;
  late String lastName;
  late String phoneNumber;
  late String address;

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            onSaved: (value) => firstName = value ?? "",
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kNamelNullError);
              }
              return null;
            },
            validator: (optionValue) {
              String value = optionValue ?? "";
              if (value.isEmpty) {
                addError(error: kNamelNullError);
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "First Name",
              hintText: "Enter your first name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffix(svgIcon: "assets/icons/User.svg",)
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          TextFormField(
            onSaved: (value) => lastName = value ?? "",
            decoration: InputDecoration(
                labelText: "Last Name (option)",
                hintText: "Enter your last name",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: CustomSurffix(svgIcon: "assets/icons/User.svg",)
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          TextFormField(
            keyboardType: TextInputType.phone,
            onSaved: (value) => firstName = value ?? "",
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPhoneNumberNullError);
              }
              return null;
            },
            validator: (optionValue) {
              String value = optionValue ?? "";
              if (value.isEmpty) {
                addError(error: kPhoneNumberNullError);
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
                labelText: "Phone Number",
                hintText: "Enter your phone number",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: CustomSurffix(svgIcon: "assets/icons/Phone.svg",)
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          TextFormField(
            keyboardType: TextInputType.phone,
            onSaved: (value) => address = value ?? "",
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kAddressNullError);
              }
              return null;
            },
            validator: (optionValue) {
              String value = optionValue ?? "";
              if (value.isEmpty) {
                addError(error: kAddressNullError);
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
                labelText: "Address",
                hintText: "Enter your phone address",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: CustomSurffix(svgIcon: "assets/icons/Phone.svg",)
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "continue",
            onTapped: () {
              if (_formKey.currentState != null && _formKey.currentState!.validate()) {

              }
            }
          )
        ],
      ),
    );
  }
}