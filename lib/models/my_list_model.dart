
import 'dart:convert';

class Product {
  final String productId;
  final String productName;
  final String brandName;
  final int price;

  Product({
    required this.productId, 
    required this.brandName,
    required this.productName,
    required this.price
  });
  
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        productId: json['productId'] ?? '', 
        brandName: json['brandName'] ?? '',
        productName: json['productName'] ?? '', 
        price: json['price'] ?? 0
    );
  }
}

class MyListModel {
  List<Product> products;

  MyListModel({required this.products});

  factory MyListModel.fromJson(Map<String, dynamic> jsonMap) {

    List<Product> _getProduct(String jsonString) {
      return List<Product>.from(json.decode(jsonString).map((item) {
        return Product.fromJson(item);
      }));
    }

    return MyListModel(
        products: _getProduct(jsonMap['products'].toString())
    );
  }
}
