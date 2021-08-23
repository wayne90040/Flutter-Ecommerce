
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screen/profile/profile_image.dart';
import 'package:flutter_ecommerce/screen/profile/profile_menu.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        ProfileImage(),
        SizedBox(height: 20),
        ProfileMenu(
          icon: "assets/icons/User Icon.svg",
          text: "My Account",
          didTapped: () {

          }
        ),
        ProfileMenu(
          icon: "assets/icons/Bell.svg",
          text: "Notifications",
          didTapped: () {

          }
        ),
        ProfileMenu(
          icon: "assets/icons/Settings.svg",
          text: "Settings",
          didTapped: () {

          }
        ),
        ProfileMenu(
            icon: "assets/icons/Question mark.svg",
            text: "Help Center",
            didTapped: () {

            }
        ),
        ProfileMenu(
            icon: "assets/icons/Log out.svg",
            text: "Log out",
            didTapped: () {

            }
        ),
      ]
    );
  }
}

