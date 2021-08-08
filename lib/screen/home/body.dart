

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/demo_product.dart';
import 'package:flutter_ecommerce/screen/home/product_card.dart';
import 'package:flutter_ecommerce/screen/home/search_bar.dart';
import 'package:flutter_ecommerce/screen/home/section_title.dart';
import 'package:flutter_ecommerce/screen/home/special_offer_card.dart';
import 'package:flutter_ecommerce/size_config.dart';

import 'categories.dart';
import 'discount_banner.dart';
import 'icon_btn_with_num.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20)
          ),
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              // TODO: Home Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SearchBar(),
                  IconBtnWithNum(
                    svgSrc: "assets/icons/Cart Icon.svg",
                    numOfItems: 0,
                    onTapped: () {
                      print("didTappedCart");
                    }
                  ),
                  IconBtnWithNum(
                      svgSrc: "assets/icons/Bell.svg",
                      numOfItems: 3,
                      onTapped: () {
                        print("didTappedBell");
                      }
                  )
                ]
              ),
              SizedBox(height: getProportionateScreenHeight(20)),

              // TODO: Home Banner
              DiscountBanner(),
              SizedBox(height: getProportionateScreenHeight(20)),

              // TODO: Categories
              Categories(),
              SizedBox(height: getProportionateScreenHeight(20)),

              // TODO: Special of you
              SectionTitle(title: "Special for you", onTapped: () {
                print("Special for you See More");
              }),
              SizedBox(height: getProportionateScreenHeight(15)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SpecialOfferCard(
                      category: "Smart phone",
                      imageSrc: "assets/images/Image Banner 2.png",
                      numOfBrands: 18,
                      onTapped: () {
                      },
                    ),
                    SpecialOfferCard(
                      category: "Fashion",
                      imageSrc: "assets/images/Image Banner 3.png",
                      numOfBrands: 24,
                      onTapped: () {
                      },
                    ),
                    SpecialOfferCard(
                      category: "Smart phone",
                      imageSrc: "assets/images/Image Banner 2.png",
                      numOfBrands: 24,
                      onTapped: () {
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(20)),

              // TODO: Popular Product
              SectionTitle(title: "Popular Product", onTapped: () {
                print("Popular Product See More");
              }),
              SizedBox(height: getProportionateScreenHeight(15)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(demoProducts.length, (index) => ProductCard(product: demoProducts[index]))
                  ],
                ),
              ),
            ]
          ),
        ),
      )
    );
  }
}





