import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:oxcompanion/components/homescreen_bottom_sheet.dart';

import '../components/home_screen_card.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _hiveBox = Hive.box('linkBox');
  var itemCountInit = 0;

  @override
  void initState() {
    itemCountInit = _hiveBox.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "0xC",
              style: GoogleFonts.jetBrainsMono(
                color: Colors.white,
              ),
            ),
            Text(
              "ompanion",
              style: GoogleFonts.jetBrainsMono(
                color: Colors.white60,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemBuilder: (context, index) => GestureDetector(
            child: HomeScreenCard(
              hiveBox: _hiveBox,
              index: index,
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
              setState(() {
                itemCountInit = _hiveBox.length;
              });
            },
            label: const Text("Add"),
            icon: const Icon(Icons.add),
            backgroundColor: Colors.white,
          ),
          Container(
            height: 20.0,
          ),
          FloatingActionButton.extended(
            heroTag: const Key("FABUploadKey"),
            onPressed: () {
              Navigator.pushNamed(context, '/upload');
              setState(() {
                itemCountInit = _hiveBox.length;
              });
            },
            label: const Text("Upload"),
            icon: const Icon(Icons.upload),
            backgroundColor: const Color(0xFFd8315e),
            foregroundColor: Colors.white,
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
