import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';

class FileModel {
  FileModel({
    required this.name,
    required this.url,
    required this.expiry,
    this.token = "token_unavailable",
  });

  final String name;
  final String url;
  final DateTime expiry;
  final String token;
  final hiveBox = Hive.box('linkBox');
  void writeDB() {
    hiveBox.put(url, [url, name, expiry, token]);
  }

  void deleteUrl() {
    hiveBox.delete(url);
  }

  Future<void> launch() async {
    final Uri parsedURL = Uri.parse(url);
    if (!await launchUrl(parsedURL)) {
      throw Exception('Could not launch $url');
    }
  }
}
