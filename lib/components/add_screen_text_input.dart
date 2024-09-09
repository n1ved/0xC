import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class AddScreenTextInput extends StatelessWidget {
  const AddScreenTextInput({
    super.key,
    required this.controller,
    required this.label,
  });

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        focusColor: kPrimaryColor,
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFce2754),
          ),
        ),
      ),
      controller: controller,
      cursorColor: Colors.white,
      style: GoogleFonts.jetBrainsMono(
        color: Colors.white,
      ),
    );
  }
}
