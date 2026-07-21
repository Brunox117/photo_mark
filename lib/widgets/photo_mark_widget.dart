import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoMarkWidget extends StatelessWidget {
  final XFile image;

  const PhotoMarkWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.file(File(image.path));
  }
}
