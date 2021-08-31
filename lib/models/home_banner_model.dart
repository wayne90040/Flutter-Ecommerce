
import 'dart:convert';


class HomeBannerModel {

  late List<DiscountBannerModel> discountBanners;
  late List<TopBannerModel> topBanners;

  HomeBannerModel({required this.discountBanners, required this.topBanners});

  factory HomeBannerModel.fromJson(Map<String, dynamic> jsonMap) {

    List<DiscountBannerModel> _getDiscountBanner(String jsonString) {
      return List<DiscountBannerModel>.from(json.decode(jsonString).map((item) {
        return DiscountBannerModel.fromJson(item);
      }));
    }

    List<TopBannerModel> _getTopBanners(String jsonString) {
      return List<TopBannerModel>.from(json.decode(jsonString).map((item) {
        return TopBannerModel.fromJson(item);
      }));
    }

    return HomeBannerModel(
        discountBanners: _getDiscountBanner(jsonMap['discount_banners'].toString()),
        topBanners: _getTopBanners(jsonMap['top_banners'].toString())
    );
  }
}

class DiscountBannerModel {
  final String title;
  final String value;
  final String code;

  DiscountBannerModel({required this.title, required this.value, required this.code });

  factory DiscountBannerModel.fromJson(Map<String, dynamic> json) {
    return DiscountBannerModel(
        title: json['title'] ?? "", 
        value: json['value'] ?? "", 
        code: json['code'] ?? ""
    );
  }
}

class TopBannerModel {
  final String clickThrough;
  final String imageUrl;
  
  TopBannerModel({required this.clickThrough, required this.imageUrl});
  
  factory TopBannerModel.fromJson(Map<String, dynamic> json) {
    return TopBannerModel(
        clickThrough: json['clickThrough'] ?? "",
        imageUrl: json['imageUrl'] ?? "");
  }
}