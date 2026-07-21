import 'package:flutter/material.dart';
import 'package:photo_mark/widgets/photo_mark_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo Mark')),
      body: const PhotoMarkWidget(),
    );
  }
}
