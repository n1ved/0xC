import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:oxcompanion/screens/home.dart';
import 'package:oxcompanion/screens/upload.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('linkBox');
  runApp(MaterialApp(
    routes: {
      '/': (context) => HomeScreen(),
      '/upload': (context) => const UploadScreen(),
    },
  ));
}
