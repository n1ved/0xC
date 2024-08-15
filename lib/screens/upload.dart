import 'dart:io';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:oxcompanion/componets/details_bottom_sheet.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  late File file;
  String fileName = "Pick a File";
  int currentLoadingState = 0;
  void pickFiles() async {
    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles();
    if (filePickerResult != null) {
      file = File(filePickerResult.files.single.path!);
      setState(() {
        fileName = file.path.split('/').last;
      });
    }
  }

  void uploadFiles() async {
    setState(() {
      currentLoadingState = 1;
    });
    String url = "http://0x0.st/";
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('file', file.path));
    request.headers['User-Agent'] = 'curl/7.68.0';
    try {
      var response = await request.send();
      print(request);
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();

        final DateTime expiry = DateTime.fromMillisecondsSinceEpoch(
            (int.parse(response.headers['x-expires']!)));
        String formattedDate = DateFormat('yMd').format(expiry);
        showModalBottomSheet(
            context: context,
            builder: (context) => DetailsBottomSheet(
                  url: responseData,
                  expiry: formattedDate,
                ));
      } else {
        print('Failed to upload file. Status code: ${response.statusCode}');
        showModalBottomSheet(
          context: context,
          builder: (context) => DetailsBottomSheet(
              url: response.statusCode.toString(), expiry: "Error"),
        );
      }
    } catch (e) {
      print('Error occurred: $e');
    }

    setState(() {
      currentLoadingState = 0;
    });
  }

  final loadingSnackbar = const SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload New File"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).colorScheme.secondaryContainer)),
              onPressed: () {
                setState(() {
                  pickFiles();
                });
              },
              child: Text(fileName),
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).colorScheme.primary)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(loadingSnackbar);
                uploadFiles();
              },
              child: Text(
                "Upload",
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
            Container(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
