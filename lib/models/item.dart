import 'dart:convert';

import 'package:flutter/material.dart';

class Product {
  final double quantiy;
  final double price;
  final Color color;
  final String name;
  Product({
    required this.quantiy,
    required this.price,
    required this.color,
    required this.name,
  });

  Product copyWith({
    double? quantiy,
    double? price,
    Color? color,
    String? name,
  }) {
    return Product(
      quantiy: quantiy ?? this.quantiy,
      price: price ?? this.price,
      color: color ?? this.color,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quantiy': quantiy,
      'price': price,
      'color': color.value,
      'name': name,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      quantiy: map['quantiy'],
      price: map['price'],
      color: Color(map['color']),
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(quantiy: $quantiy, price: $price, color: $color, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Product &&
      other.quantiy == quantiy &&
      other.price == price &&
      other.color == color &&
      other.name == name;
  }

  @override
  int get hashCode {
    return quantiy.hashCode ^
      price.hashCode ^
      color.hashCode ^
      name.hashCode;
  }
}
