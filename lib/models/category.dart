import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.white,
    this.icon = Icons.abc,
  });
  final String id;
  final String title;
  final Color color;
  final IconData icon;
}
