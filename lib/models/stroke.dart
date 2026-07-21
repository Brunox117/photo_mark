import 'package:flutter/material.dart';

class Stroke {
  final Color color;
  final double width;
  final List<Offset> points;
  final double opacity;

  Stroke({
    required this.color,
    this.width = 1,
    required this.points,
    this.opacity = 0.5,
  });
}
