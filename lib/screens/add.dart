import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

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
      appBar: AppBar(
        title: const Text("Add Existing Link"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter 0x0 URL Here",
              ),
              controller: urlEditingController,
            ),
            Container(height: 20.0),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Name of the file",
              ),
              controller: nameEditingController,
            ),
            Container(height: 20.0),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Expiry of the file",
              ),
              controller: expiryEditingController,
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
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).colorScheme.primary)),
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
