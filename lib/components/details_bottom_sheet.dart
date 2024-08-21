import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsBottomSheet extends StatelessWidget {
  const DetailsBottomSheet(
      {super.key, required this.url, required this.expiry});

  final String url;
  final String expiry;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              url,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            Text(
              "Expires on $expiry",
              style: GoogleFonts.jetBrainsMono(
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFce2754),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: url));
                },
                child: Text("Copy Link", style: GoogleFonts.jetBrainsMono()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
