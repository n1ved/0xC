import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:oxcompanion/components/homescreen_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _hiveBox = Hive.box('linkBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("0xCompanion"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemBuilder: (context, index) => GestureDetector(
              child: Card(
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_hiveBox.getAt(index)[1]),
                      Text(_hiveBox.getAt(index)[2])
                    ],
                  ),
                ),
              ),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => HomescreenBottomSheet(
                          url: _hiveBox.getAt(index)[0],
                          name: _hiveBox.getAt(index)[1],
                          expiry: _hiveBox.getAt(index)[2],
                        ));
              },
            ),
            itemCount: _hiveBox.length,
          ),
        ),
        floatingActionButton: Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.end,
          children: [
            FloatingActionButton.extended(
              heroTag: const Key("FABAddKey"),
              onPressed: () {
                Navigator.pushNamed(context, '/add');
              },
              label: const Text("Add"),
              icon: const Icon(Icons.add),
            ),
            Container(
              height: 20.0,
            ),
            FloatingActionButton.extended(
              heroTag: const Key("FABUploadKey"),
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
