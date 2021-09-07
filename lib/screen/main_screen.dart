import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/demo_product.dart';
import 'package:flutter_ecommerce/screen/home/home_screen.dart';
import 'package:flutter_ecommerce/screen/product_detail/product_detail_screen.dart';
import 'package:flutter_ecommerce/screen/profile/custom_bottom_nav_bar.dart';
import 'package:flutter_ecommerce/screen/profile/profile_menu.dart';
import 'package:flutter_ecommerce/screen/profile/profile_screen.dart';
import 'package:flutter_ecommerce/viewmodels/home_view_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../size_config.dart';
import 'cart/cart_screen.dart';
import 'home/body.dart';
import 'home/discount_banner.dart';
import 'home/home_header.dart';
import 'home/icon_btn_with_num.dart';
import 'home/product_card.dart';
import 'home/search_bar.dart';
import 'home/section_title.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _selectedIndex = 0;

  static List<Widget> _screenOption = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    ProfileScreen()
  ];

  void _onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Color isActiveColor = Color(0xFFB6B6B6);

    // TODO: implement build
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screenOption,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Shop Icon.svg",
              color: _selectedIndex == 0 ? kPrimaryColor : isActiveColor,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Heart Icon.svg",
              color: _selectedIndex == 1 ? kPrimaryColor : isActiveColor,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Chat bubble Icon.svg",
              color: _selectedIndex == 2 ? kPrimaryColor : isActiveColor,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/User Icon.svg",
              color: _selectedIndex == 3 ? kPrimaryColor : isActiveColor,
            ),
            label: '',
            backgroundColor: Colors.white,
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onTappedItem,
      ),
    );
  }
}