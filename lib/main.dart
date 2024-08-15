import 'package:flutter/material.dart';
import 'package:oxcompanion/screens/home.dart';
import 'package:oxcompanion/screens/upload.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => const HomeScreen(),
      '/upload': (context) => UploadScreen(),
    },
  ));
}
