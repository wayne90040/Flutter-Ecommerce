

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/widget/custom_surffix_icon.dart';
import 'package:flutter_ecommerce/widget/default_button.dart';
import 'package:flutter_ecommerce/widget/form_error.dart';

import '../../constants.dart';
import '../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late String confirmPassword;
  final List<String> errors = [];

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
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) => email = value!,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  removeError(error: kEmailNullError);
                } else if (emailValidatorRegExp.hasMatch(value)) {
                  removeError(error: kInvalidEmailError);
                }
                return null;
              },
              validator: (value) {

                String strongValue = value ?? "";
                if (strongValue.isEmpty) {
                  addError(error: kEmailNullError);
                } else if (emailValidatorRegExp.hasMatch(strongValue)) {
                  addError(error: kInvalidEmailError);
                }
                return "";
              },
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: CustomSurffix(svgIcon: "assets/icons/Mail.svg",)
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            TextFormField(
              obscureText: true,
              onSaved: (value) => password = value ?? "",
              onChanged: (value) {
                if (value.isNotEmpty) {
                  removeError(error: kPassNullError);
                } else if (value.length >= 8) {
                  removeError(error: kShortPassError);
                }
                password = value;
              },
              validator: (value) {
                String strongValue = value ?? "";
                if (strongValue.isEmpty) {
                  addError(error: kPassNullError);
                } else if (strongValue.length < 8) {
                  addError(error: kShortPassError);
                }
                return "";
              },
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
                // If  you are using latest version of flutter then lable text and hint text shown like this
                // if you r using flutter less then 1.20.* then maybe this is not working properly
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: CustomSurffix(svgIcon: "assets/icons/Lock.svg"),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            TextFormField(
              obscureText: true,
              onSaved: (value) => confirmPassword = value ?? "",
              onChanged: (value) {
                if (value.isNotEmpty) {
                  removeError(error: kPassNullError);
                } else if (value.isNotEmpty && password == confirmPassword) {
                  removeError(error: kMatchPassError);
                }
                confirmPassword = value;
              },
              validator: (value) {
                String strongValue = value ?? "";
                if (strongValue.isEmpty) {
                  addError(error: kPassNullError);
                } else if ((password != strongValue)) {
                  addError(error: kMatchPassError);
                }
                return "";
              },
              decoration: InputDecoration(
                  labelText: "Confirm Password",
                  hintText: "Re-enter your password",
                  // If  you are using latest version of flutter then lable text and hint text shown like this
                  // if you r using flutter less then 1.20.* then maybe this is not working properly
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: CustomSurffix(svgIcon: "assets/icons/Lock.svg")
              ),
            ),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(40)),
            DefaultButton(
                text: "Continue",
                onTapped: () {
                  if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // valid, then go to screen
                  }
                }
            )
          ],
        )
    );
  }
}