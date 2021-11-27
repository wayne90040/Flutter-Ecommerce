

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/api_service.dart';
import 'package:flutter_ecommerce/screen/complete_profile/complete_profile_screen.dart';
import 'package:flutter_ecommerce/viewmodels/sign_up_view_model.dart';
import 'package:flutter_ecommerce/widget/custom_surffix_icon.dart';
import 'package:flutter_ecommerce/widget/default_button.dart';
import 'package:flutter_ecommerce/widget/form_error.dart';
import 'package:provider/provider.dart';

import '../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  final _formKey = GlobalKey<FormState>();
  late String userName;
  late String email;
  late String password;
  late String confirmPassword;
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var viewModel = Provider.of<SignUpViewModel>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildUserNameTextFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),

          _buildEmailTextFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),

          _buildPasswordTextFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),

          _buildConfirmPassTextFormField(),
          SizedBox(height: 10),

          FormError(errors: viewModel.errors),
          SizedBox(height: getProportionateScreenHeight(40)),

          DefaultButton(
            text: "Continue",
            onTapped: () {
              _formKey.currentState!.save();
              viewModel.registerWithEmailInSpring(userName, email, password, confirmPassword).then((success) {
                if (success) {
                  ApiService().loginWithEmail(email, password).then((result) {
                    if (result.success) {
                      Navigator.pushNamedAndRemoveUntil(context, CompleteProfileScreen.routeName, (route) => false);
                    }
                  });
                }
              });
            }
          )
        ],
      )
    );
  }

  TextFormField _buildUserNameTextFormField() {
    return TextFormField(
      onSaved: (value) {
        userName = value!;
      },
      decoration: InputDecoration(
        labelText: "Username",
        hintText: "Enter your username",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffix(svgIcon: "assets/icons/User.svg",)
      ),
    );
  }

  TextFormField _buildEmailTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => email = value!,
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffix(svgIcon: "assets/icons/Mail.svg",)
      ),
    );
  }

  TextFormField _buildConfirmPassTextFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (value) => confirmPassword = value ?? "",
      decoration: InputDecoration(
          labelText: "Confirm Password",
          hintText: "Re-enter your password",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffix(svgIcon: "assets/icons/Lock.svg")
      ),
    );
  }

  TextFormField _buildPasswordTextFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (value) => password = value ?? "",
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffix(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }
}