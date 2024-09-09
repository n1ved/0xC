import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:oxcompanion/components/add_screen_text_input.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final urlEditingController = TextEditingController();
  final nameEditingController = TextEditingController();
  final expiryEditingController = TextEditingController();
  final _hiveBox = Hive.box('linkBox');
  @override
  void dispose() {
    urlEditingController.dispose();
    nameEditingController.dispose();
    expiryEditingController.dispose();
    super.dispose();
  }

  void writeDB({url, name, expiry}) {
    _hiveBox.put(url, [url, name, expiry]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Add Existing Link",
          style: GoogleFonts.jetBrainsMono(),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AddScreenTextInput(
              controller: urlEditingController,
              label: "URL",
            ),
            Container(height: 20.0),
            AddScreenTextInput(
              controller: nameEditingController,
              label: "File Name",
            ),
            Container(height: 20.0),
            AddScreenTextInput(
              controller: expiryEditingController,
              label: "Expiry",
            ),
            Container(height: 20.0),
            TextButton(
              onPressed: () {
                writeDB(
                  url: urlEditingController.text,
                  name: nameEditingController.text,
                  expiry: expiryEditingController.text,
                );
                urlEditingController.clear();
                nameEditingController.clear();
                expiryEditingController.clear();
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFce2754),
                foregroundColor: Colors.white,
              ),
              child: Text(
                "Save",
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              ),
            )
          ],
        ),
      ),
    );
  }
}
