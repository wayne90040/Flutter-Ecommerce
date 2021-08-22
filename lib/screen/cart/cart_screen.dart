

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/cart.dart';
import 'package:flutter_ecommerce/screen/cart/body.dart';

import 'checkout_bottom.dart';

class CartScreen extends StatelessWidget {

  static String routeName = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text("Your Cart", style: TextStyle(color: Colors.black)),
            Text("${demoCarts.length} items", style: Theme.of(context).textTheme.caption)
          ],
        ),
      ),
      body: Body(),
      bottomNavigationBar:
        CheckoutBottom()
    );
  }
}
