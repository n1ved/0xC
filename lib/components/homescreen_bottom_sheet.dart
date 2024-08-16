import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class HomescreenBottomSheet extends StatelessWidget {
  const HomescreenBottomSheet(
      {super.key, required this.url, required this.name, required this.expiry});

  final String url, name, expiry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            url,
            style: const TextStyle(
              fontSize: 24.0,
            ),
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            expiry,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: url));
                  },
                  child: const Text('Copy')),
              TextButton(
                  onPressed: () async {
                    _launchUrl();
                  },
                  child: const Text('Open')),
            ],
          )
        ],
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
