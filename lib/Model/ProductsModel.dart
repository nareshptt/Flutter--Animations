import 'dart:ui';

import 'package:flutter/material.dart';

class Product {
  final color;
  final String image;
  Product({required this.color, required this.image});
}

List<Product> products = [
  Product(
    color: Color(0xff000000),
    image: 'images/photo0.png',
  ),
  Product(color: Color(0xfffcecd0), image: 'images/photo1.png'),
  Product(color: Color(0xffb6d7e4), image: 'images/photo2.png'),
];
