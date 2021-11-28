
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/zone.dart';

import 'landing_icon_widget.dart';

class HomeHeader extends StatelessWidget {

  final List<Category> zones;

  const HomeHeader({
    Key? key,
    required this.zones,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
              zones.length, (index) => Padding(
                padding: EdgeInsets.only(right: 15),
                child: LandingIconWidget(
                    iconSrc: zones[index].iconZh,
                    iconText: zones[index].nameZh,
                    onTapped: () {
                      print("didTapped${zones[index].nameZh}");
                    }
                ),
              )
          )
        ],
      ),
    );
  }
}