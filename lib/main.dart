import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nullcompanion/constants/const.dart';
import 'package:nullcompanion/components/bottom_navigation.dart';
import 'package:nullcompanion/components/file_card.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
        child: ListView.builder(
          itemBuilder: (context, index) => FileCard(),
          itemCount: 5,
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
