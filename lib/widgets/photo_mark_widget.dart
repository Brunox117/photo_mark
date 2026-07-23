import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_mark/models/stroke.dart';
import 'package:photo_mark/widgets/photo_painter.dart';
import 'package:photo_mark/widgets/stroke_width_selector.dart';
import 'package:photo_mark/widgets/tool_icon_button.dart';
import 'package:photo_mark/widgets/tool_panel.dart';

class PhotoMarkWidget extends StatefulWidget {
  final XFile image;

  const PhotoMarkWidget({super.key, required this.image});

  @override
  State<PhotoMarkWidget> createState() => _PhotoMarkWidgetState();
}

class _PhotoMarkWidgetState extends State<PhotoMarkWidget> {
  List<Stroke> strokes = [];
  int currentStroke = 0;
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
  ];
  int currentColor = 0;
  final List<double> strokeWidths = [2, 6, 12];
  double currentWidth = 2;

  void resetStrokes() {
    setState(() {
      strokes = [];
      currentStroke = 0;
      currentColor = 0;
    });
  }

  void removeLastStroke() {
    setState(() {
      if (strokes.isNotEmpty) {
        strokes.removeLast();
        currentStroke--;
        currentColor = (currentColor - 1) % colors.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: Image.file(
            File(widget.image.path),
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: CustomPaint(
            painter: PhotoPainter(strokes: strokes),
          ),
        ),
        Positioned.fill(
          child: GestureDetector(
            onPanStart: (details) {
              setState(() {
                strokes.add(
                  Stroke(
                    color: colors[currentColor],
                    width: currentWidth,
                    points: [details.localPosition],
                    opacity: 0.5,
                  ),
                );
              });
            },
            onPanUpdate: (details) {
              setState(() {
                strokes[currentStroke].points.add(details.localPosition);
              });
            },
            onPanEnd: (details) {
              setState(() {
                currentStroke++;
                currentColor = (currentColor + 1) % colors.length;
              });
            },
          ),
        ),
        Positioned(
          top: 12,
          left: 12,
          child: ToolPanel(
            child: StrokeWidthSelector(
              widths: strokeWidths,
              currentWidth: currentWidth,
              accent: colors[currentColor],
              onChanged: (width) => setState(() => currentWidth = width),
            ),
          ),
        ),
        Positioned(
          bottom: 12,
          right: 12,
          child: ToolPanel(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ToolIconButton(
                  icon: Icons.undo_rounded,
                  onPressed: removeLastStroke,
                ),
                const SizedBox(height: 4),
                ToolIconButton(
                  icon: Icons.delete_outline_rounded,
                  onPressed: resetStrokes,
                  destructive: true,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
