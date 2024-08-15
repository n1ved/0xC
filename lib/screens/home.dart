import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("0xCompanion"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Theme.of(context).primaryColor,
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Link"), Text("16 Jul 2025")],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.end,
          children: [
            FloatingActionButton.extended(
              onPressed: () {},
              label: const Text("Add"),
              icon: const Icon(Icons.add),
            ),
            Container(
              height: 20.0,
            ),
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.pushNamed(context, '/upload');
              },
              label: const Text("Upload"),
              icon: const Icon(Icons.upload),
            ),
          ],
        ));
  }
}
