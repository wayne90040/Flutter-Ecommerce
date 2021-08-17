
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/product.dart';

import 'custom_app_bar.dart';

class ProductDetailScreen extends StatelessWidget {
  static String routeName = "/productDetails";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xfff5f6f9),
      appBar: CustomAppBar(rating: 4.5),

    );
  }
}

// TODO: Use arguments class to pass product to product detail screen
class ProductDetailArguments {
  final Product product;
  ProductDetailArguments({required this.product});
}