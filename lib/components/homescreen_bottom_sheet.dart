import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class HomescreenBottomSheet extends StatelessWidget {
  const HomescreenBottomSheet(
      {super.key, required this.url, required this.name, required this.expiry});

  final String url, name, expiry;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF1E1E1E),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              url,
              style: const TextStyle(
                fontSize: 24.0,
                color: Colors.white,
              ),
            ),
            Text(
              "File Name : $name",
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            Text(
              "Expires on $expiry",
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    final Uri _uri = Uri.parse(url);
    if (!await launchUrl(_uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
