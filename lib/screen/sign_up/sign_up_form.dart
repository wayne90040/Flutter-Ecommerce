

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screen/complete_profile/complete_profile_screen.dart';
import 'package:flutter_ecommerce/viewmodels/sign_up_view_model.dart';
import 'package:flutter_ecommerce/widget/custom_surffix_icon.dart';
import 'package:flutter_ecommerce/widget/default_button.dart';
import 'package:flutter_ecommerce/widget/form_error.dart';
import 'package:provider/provider.dart';

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
    var viewModel = Provider.of<SignUpViewModel>(context);
    return Form(
        key: _formKey,
        child: Column(
          children: [
            _buildEmailTextFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            _buildPasswordTextFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            _buildConfirmPassTextFormField(),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(40)),
            DefaultButton(
              text: "Continue",
              onTapped: () {
                _formKey.currentState!.save();
                viewModel.registrationWithEmail(email: email, password: password, confirmPassword: confirmPassword);

                switch (viewModel.status) {
                  case LoadingStatus.loading:
                  // TODO: Handle this case.
                    print("isLoading");
                    break;
                  case LoadingStatus.none:
                  // TODO: Handle this case.
                    print("none");
                    break;
                  case LoadingStatus.error:
                  // TODO: Handle this case.
                    print("error: 2");
                    break;
                  case LoadingStatus.success:
                  // TODO: Handle this case.
                    print("done");
                    Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                    break;
                }
                if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                }
              }
            )
          ],
        )
    );
  }


  TextFormField _buildConfirmPassTextFormField() {
    return TextFormField(
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
          return "";
        } else if ((password != strongValue)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
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
          return "";
        } else if (strongValue.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
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

  TextFormField _buildEmailTextFormField() {
    return TextFormField(
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
          return "";
        } else if (!emailValidatorRegExp.hasMatch(strongValue)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffix(svgIcon: "assets/icons/Mail.svg",)
      ),
    );
  }
}