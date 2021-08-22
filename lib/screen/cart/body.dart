

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/cart.dart';
import 'package:flutter_ecommerce/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'cart_item.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: demoCarts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
                key: Key(demoCarts[0].product.id.toString()),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  // 刪除後的 call back
                  demoCarts.removeAt(index);
                  print("remove");
                },
                background: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    children: [
                      Spacer(),
                      SvgPicture.asset("assets/icons/Trash.svg")
                    ],
                  ),
                ),
                child: CartItem(cart: demoCarts[index])
            ),
          );
        }
      ),
    );
  }
}