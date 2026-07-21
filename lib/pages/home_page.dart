import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_mark/widgets/photo_mark_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker picker = ImagePicker();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo Mark')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  picker.pickImage(source: ImageSource.camera).then((value) {
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
                    PhotoMarkWidget(image: image!),
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
              : const Text('Sin imagen seleccionada'),
        ],
      ),
    );
  }
}
