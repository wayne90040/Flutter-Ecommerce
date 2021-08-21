

import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce/models/product.dart';

import 'color_dot.dart';

class ColorDots extends StatefulWidget {

  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _ColorDotsState createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ColorDots> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          ...List.generate(widget.product.colors.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: ColorDot(
                color: widget.product.colors[index],
                isSelected: selectedIndex == index,
              ),
            );
          }),
        ]
    );
  }
}