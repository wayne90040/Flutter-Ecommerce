

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screen/forgot_password/forgot_password_screen.dart';
import 'package:flutter_ecommerce/screen/home/home_screen.dart';
import 'package:flutter_ecommerce/screen/login_success/login_success_screen.dart';
import 'package:flutter_ecommerce/widget/custom_surffix_icon.dart';
import 'package:flutter_ecommerce/widget/default_button.dart';
import 'package:flutter_ecommerce/widget/form_error.dart';

import '../../constants.dart';
import '../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();  // 局部更新
  final List<String> errors = [];
  late String email;
  late String password;
  bool isRememberPassword = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailTextField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPasswordTextField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          Row(
            children: [
              Checkbox(
                  value: isRememberPassword,  // 勾勾的 color
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      isRememberPassword = value ?? false;
                    });
                  }
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                },
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          DefaultButton(
            text: "Continue",
            onTapped: () {
              if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // 註冊成功，成功登入
                Navigator.of(context).pushNamedAndRemoveUntil(LoginSuccessScreen.routeName,
                        (Route<dynamic> route) => false
                );
              }
            },
          )
        ],
      ),
    );
  }

  // TODO: Password Text
  TextFormField buildPasswordTextField() {
    return TextFormField(
      onSaved: (value) => password = value ?? "",
      obscureText: true,
      onChanged: (value) {
        if ((value).isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (value.length > 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
      },
      validator: (value) {
        // 不能有重複的 Error
        if ((value ?? "").isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
          return "";
        } else if ((value ?? "").length < 8 && !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",
          // 浮動 Label Show method
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffix(svgIcon: "assets/icons/Lock.svg")
      ),
    );
  }

  // TODO: Email Text
  TextFormField buildEmailTextField() {
    return TextFormField(
      onSaved: (value) => email = value ?? "",

      onChanged: (value) {
        if ((value).isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) && errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
      },
      validator: (value) {
        // 不能有重複的 Error
        if ((value ?? "").isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value ?? "") && !errors.contains(kInvalidEmailError) ) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter your Email",
          // 浮動 Label Show method
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffix(svgIcon: "assets/icons/Mail.svg",)
      ),
    );
  }
}