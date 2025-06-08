import 'package:flutter/material.dart';
import 'package:nullcompanion/constants/const.dart';
import 'package:nullcompanion/data/models/data_model.dart';
import 'package:nullcompanion/screens/home_page.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<SavedURL>(savedURLBox);
  runApp(MaterialApp(routes: {'/': (context) => HomePage()}));
}
