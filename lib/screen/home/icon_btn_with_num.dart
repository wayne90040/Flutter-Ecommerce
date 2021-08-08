

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import '../../size_config.dart';

class IconBtnWithNum extends StatelessWidget {
  final String svgSrc;
  final int numOfItems;
  final GestureTapCallback onTapped;

  const IconBtnWithNum({
    Key? key,
    required this.svgSrc,
    this.numOfItems = 0,
    required this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
          overflow: Overflow.visible,  // 超出 顯示(or 剪掉)
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(12)),
              height: getProportionateScreenWidth(46),
              width: getProportionateScreenHeight(46),
              decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  shape: BoxShape.circle
              ),
              child: SvgPicture.asset(svgSrc),
            ),
            if (numOfItems != 0)
              buildNumText()
          ]
      ),
    );
  }

  Positioned buildNumText() {
    return Positioned(
      right: 0,
      top: -3,
      child: Container(
        height: getProportionateScreenWidth(16),
        width: getProportionateScreenHeight(16),
        decoration: BoxDecoration(
            color: Color(0xFFFF4848),
            shape: BoxShape.circle,
            border: Border.all(width: 1.5, color: Colors.white)
        ),
        child: Center(
          child: Text(
              "$numOfItems",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(10),
                  height: 1,
                  color: Colors.white,
                  fontWeight: FontWeight.w600
              )
          ),
        ),
      ),
    );
  }
}