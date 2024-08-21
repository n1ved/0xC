import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:oxcompanion/components/details_bottom_sheet.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  late File file;
  String fileName = "Pick a File";
  int currentLoadingState = 0;
  final _hiveBox = Hive.box('linkBox');
  void pickFiles() async {
    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles();
    if (filePickerResult != null) {
      file = File(filePickerResult.files.single.path!);
      setState(() {
        fileName = file.path.split('/').last;
      });
    }
  }

  void writeDB({url, name, expiry}) {
    _hiveBox.put(url, [url, name, expiry]);
  }

  void uploadFiles() async {
    ScaffoldMessenger.of(context).showSnackBar(loadingSnackbar);
    setState(() {
      currentLoadingState = 1;
    });
    String url = "http://0x0.st/";
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('file', file.path));
    request.headers['User-Agent'] = 'curl/7.68.0';
    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();

        final DateTime expiry = DateTime.fromMillisecondsSinceEpoch(
            (int.parse(response.headers['x-expires']!)));
        String formattedDate = DateFormat('yMd').format(expiry);
        setState(() {
          writeDB(
            url: responseData.toString().substring(0, responseData.length - 1),
            name: file.path.split('/').last,
            expiry: formattedDate,
          );
        });
        showModalBottomSheet(
          context: context,
          builder: (context) => DetailsBottomSheet(
            url: responseData.toString().substring(0, responseData.length - 1),
            expiry: formattedDate,
          ),
          backgroundColor: Color(0xFF1e1e1e),
        );
      } else {
        showModalBottomSheet(
          context: context,
          builder: (context) => DetailsBottomSheet(
              url: response.statusCode.toString(), expiry: "Error"),
        );
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  final loadingSnackbar = SnackBar(
    content: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Uploading File",
            style: GoogleFonts.jetBrainsMono(
              fontSize: 20.0,
            ),
          ),
        ),
        const CircularProgressIndicator(
          color: Color(0xFFce2754),
        ),
      ],
    ),
    backgroundColor: Colors.transparent,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      key: const Key("uploadPageScaffoldKey"),
      appBar: AppBar(
        title: Text("Upload New File", style: GoogleFonts.jetBrainsMono()),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  pickFiles();
                });
              },
              child: Text(
                fileName,
                style: GoogleFonts.jetBrainsMono(),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFce2754),
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                uploadFiles();
              },
              child: Text(
                "Upload",
                style: GoogleFonts.jetBrainsMono(),
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
