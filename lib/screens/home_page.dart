import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:nullcompanion/data/models/data_model.dart';
import '../components/bottom_navigation.dart';
import '../components/file_card.dart';
import '../constants/const.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final savedURLs = Hive.box<SavedURL>(savedURLBox).values;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "0xC",
          style: GoogleFonts.jetBrainsMono(
            fontSize: 56.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child:
            savedURLs.isEmpty
                ? Center(child: Text("No files to display"))
                : ListView.builder(
                  itemBuilder: (context, index) => FileCard(),
                  itemCount: savedURLs.length,
                ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
