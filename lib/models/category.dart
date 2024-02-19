import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
    required this.image,
  });
  final String image;
  final String id;
  final String title;
  final Color color;
}
