import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
            Text("Expires on $expiry"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.primary)),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: url));
                },
                child: Text(
                  "Copy Link",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
