import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:oxcompanion/models/file_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import 'details_sheet.dart';

class HomeScreenCard extends StatelessWidget {
  HomeScreenCard({
    super.key,
    required this.details,
  });

  final FileModel details;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff1e1e1e),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(details.url.split('//').last,
                style: GoogleFonts.jetBrainsMono(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  letterSpacing: 1.2,
                )),
            Text(
              details.name,
              style: GoogleFonts.jetBrainsMono(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w300,
                letterSpacing: 1.12,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton.filledTonal(
                    onPressed: () {
                      Clipboard.setData(
                        ClipboardData(
                          text: details.url,
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.copy,
                      size: 20.0,
                    ),
                    color: Colors.black,
                    style: IconButton.styleFrom(backgroundColor: Colors.white),
                  ),
                  IconButton.filledTonal(
                    onPressed: () {
                      details.launch();
                    },
                    icon: const Icon(
                      Icons.open_in_new,
                      size: 20.0,
                    ),
                    color: Colors.black,
                    style: IconButton.styleFrom(backgroundColor: Colors.white),
                  ),
                  IconButton.filledTonal(
                    onPressed: () {
                      details.deleteUrl();
                    },
                    icon: const Icon(
                      Icons.delete_forever,
                      size: 20.0,
                    ),
                    color: Colors.black,
                    style: IconButton.styleFrom(backgroundColor: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => DetailsSheet(
                          details: details,
                        ),
                        backgroundColor: const Color(0xFF1E1E1E),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                    ),
                    child: Text(
                      "More Info",
                      style: GoogleFonts.jetBrainsMono(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
