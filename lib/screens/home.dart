import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:oxcompanion/components/homescreen_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

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
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}

class HomeScreenCard extends StatelessWidget {
  HomeScreenCard({
    super.key,
    required Box hiveBox,
    required this.index,
  }) : _hiveBox = hiveBox;

  final Box _hiveBox;
  late int index;

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

  Future<void> _launchUrl(url) async {
    final Uri _uri = Uri.parse(url);
    if (!await launchUrl(_uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
