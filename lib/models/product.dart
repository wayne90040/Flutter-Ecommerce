

import 'dart:ui';

class Product {
  final int id;
  final String title;
  final String description;
  final List<String> images;
  final List<Color> colors;
  final double rating;
  final double price;
  final bool isFavourite;
  final bool isPopular;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.colors,
    required this.rating,
    required this.price,
    this.isFavourite = false,
    this.isPopular = false
  });
}