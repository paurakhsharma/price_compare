import 'dart:convert';

import 'package:flutter/material.dart';

class Product {
  final double quantiy;
  final double price;
  final Color color;
  Product({
    required this.quantiy,
    required this.price,
    required this.color,
  });
  

  Product copyWith({
    double? quantiy,
    double? price,
    Color? color,
  }) {
    return Product(
      quantiy: quantiy ?? this.quantiy,
      price: price ?? this.price,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quantiy': quantiy,
      'price': price,
      'color': color.value,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      quantiy: map['quantiy'],
      price: map['price'],
      color: Color(map['color']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));

  @override
  String toString() => 'Product(quantiy: $quantiy, price: $price, color: $color)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Product &&
      other.quantiy == quantiy &&
      other.price == price &&
      other.color == color;
  }

  @override
  int get hashCode => quantiy.hashCode ^ price.hashCode ^ color.hashCode;
}
