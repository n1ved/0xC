import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'homescreen_bottom_sheet.dart';

class HomeScreenCard extends StatelessWidget {
  HomeScreenCard({
    super.key,
    required Box hiveBox,
    required this.index,
  }) : _hiveBox = hiveBox;

  final Box _hiveBox;
  late int index;

  Future<void> _launchUrl(url) async {
    final Uri _uri = Uri.parse(url);
    if (!await launchUrl(_uri)) {
      throw Exception('Could not launch $url');
    }
  }

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
            Text(_hiveBox.getAt(index)[0].split('//').last,
                style: GoogleFonts.jetBrainsMono(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  letterSpacing: 1.2,
                )),
            Text(
              _hiveBox.getAt(index)[1],
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
                          text: _hiveBox.getAt(index)[0],
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
                      _launchUrl(_hiveBox.getAt(index)[0]);
                    },
                    icon: const Icon(
                      Icons.open_in_new,
                      size: 20.0,
                    ),
                    color: Colors.black,
                    style: IconButton.styleFrom(backgroundColor: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => HomescreenBottomSheet(
                          url: _hiveBox.getAt(index)[0],
                          name: _hiveBox.getAt(index)[1],
                          expiry: _hiveBox.getAt(index)[2],
                        ),
                        backgroundColor: const Color(0xFF1E1E1E),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFce2754),
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
