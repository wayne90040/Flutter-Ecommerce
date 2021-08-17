

import 'package:flutter/cupertino.dart';

import 'category_card.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
      {"icon": "assets/icons/Discover.svg", "text": "More"}
    ];

    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(
            categories.length,
                (index) => CategoryCard(
                iconSrc: categories[index]["icon"],
                iconText: categories[index]["text"],
                onTapped: () {
                  print("didTapped${categories[index]["text"]}]");
                }
            )
        )
      ],
    );
  }
}