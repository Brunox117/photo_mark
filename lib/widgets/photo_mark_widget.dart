import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoMarkWidget extends StatefulWidget {
  const PhotoMarkWidget({super.key});

  @override
  State<PhotoMarkWidget> createState() => _PhotoMarkWidgetState();
}

class _PhotoMarkWidgetState extends State<PhotoMarkWidget> {
  final ImagePicker? picker = ImagePicker();
  XFile? image;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: () {
                picker?.pickImage(source: ImageSource.camera).then((value) {
                  setState(() {
                    image = value;
                  });
                });
              },
              icon: const Icon(Icons.add_a_photo),
              label: const Text('Seleccionar imagen'),
            ),
          ],
        ),
        (image != null)
            ? Column(
                children: [
                  Image.file(File(image!.path)),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        image = null;
                      });
                    },
                    child: const Text('Borrar imagen'),
                  ),
                ],
              )
            : Text('Sin imagen seleccionada'),
      ],
    );
  }
}
