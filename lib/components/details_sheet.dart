import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oxcompanion/models/file_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsSheet extends StatelessWidget {
  const DetailsSheet({
    super.key,
    required this.details,
  });

  final FileModel details;

  String formatDate() => DateFormat('yMd').format(details.expiry);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1E1E1E),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              details.url,
              style: const TextStyle(
                fontSize: 24.0,
                color: Colors.white,
              ),
            ),
            Text(
              "File Name : ${details.name}",
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            Text(
              "Expires on ${formatDate()}",
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
}
