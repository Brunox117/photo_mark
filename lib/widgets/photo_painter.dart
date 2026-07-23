import 'package:flutter/material.dart';
import 'package:photo_mark/models/stroke.dart';

class PhotoPainter extends CustomPainter {
  final List<Stroke> strokes;
  PhotoPainter({required this.strokes});
  @override
  void paint(Canvas canvas, Size size) {
    for (Stroke stroke in strokes) {
      Paint paint = Paint();
      paint.color = stroke.color;
      paint.strokeWidth = stroke.width;
      paint.style = PaintingStyle.stroke;
      paint.strokeCap = StrokeCap.round;
      paint.strokeJoin = StrokeJoin.round;
      canvas.drawPath(Path()..addPolygon(stroke.points, false), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
