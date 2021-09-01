

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/demo_product.dart';
import 'package:flutter_ecommerce/models/home_banner_model.dart';
import 'package:flutter_ecommerce/screen/cart/cart_screen.dart';
import 'package:flutter_ecommerce/screen/home/product_card.dart';
import 'package:flutter_ecommerce/screen/home/search_bar.dart';
import 'package:flutter_ecommerce/screen/home/section_title.dart';
import 'package:flutter_ecommerce/screen/home/special_offer_card.dart';
import 'package:flutter_ecommerce/screen/product_detail/product_detail_screen.dart';
import 'package:flutter_ecommerce/size_config.dart';
import 'package:flutter_ecommerce/viewmodels/home_view_model.dart';
import 'package:provider/provider.dart';

import 'categories.dart';
import 'discount_banner.dart';
import 'icon_btn_with_num.dart';

class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false).getHomeBannerInFirebase();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<HomeViewModel>(context);
    print("Body Build");

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
                      Navigator.pushNamed(context, CartScreen.routeName);
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

              CategoriesWidget(models: viewModel.homeBanner.topBanners),
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
                    ...List.generate(
                        demoProducts.length,
                        (index) {
                          return ProductCard(product: demoProducts[index], onTapped: () {
                            Navigator.pushNamed(
                                context, ProductDetailScreen.routeName,
                                arguments: ProductDetailArguments(product: demoProducts[index]));
                          });
                        }
                    )
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

class CategoriesWidget extends StatelessWidget {

  final List<TopBannerModel> models;

  const CategoriesWidget({
    Key? key, required this.models,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(models.length, (index) {
            TopBannerModel model = models[index];
            return SpecialOfferCard(
              category: model.category,
              imageSrc: "assets/images/Image Banner 2.png",
              numOfBrands: model.numOfBrand,
              onTapped: () {

              }
            );
          }),
        ],
      ),
    );
  }
}





