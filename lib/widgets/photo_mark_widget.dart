import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_mark/models/stroke.dart';

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
    Colors.brown,
    Colors.grey,
    Colors.black,
  ];
  int currentColor = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.file(File(widget.image.path)),
        GestureDetector(
          onPanStart: (details) {
            setState(() {
              strokes.add(
                Stroke(
                  color: colors[currentColor],
                  width: 1,
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
            print(strokes);
          },
          child: Positioned.fill(child: SizedBox.shrink()),
        ),
      ],
    );
  }
}
