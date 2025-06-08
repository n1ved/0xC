import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/bottom_navigation.dart';
import '../components/file_card.dart';
import '../constants/const.dart';

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
