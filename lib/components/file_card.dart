import 'package:flutter/material.dart';
import 'package:nullcompanion/constants/const.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nullcompanion/data/models/data_model.dart';

class FileCard extends StatelessWidget {
  const FileCard({super.key, required this.url});
  final SavedURL url;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: containerGrey,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        spacing: 10.0,
        children: [
          Container(
            width: 55.0,
            height: 55.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.grey,
            ),
            child: Icon(Icons.picture_as_pdf_outlined, size: 30.0),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                url.name,
                style: GoogleFonts.robotoMono(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                url.url,
                style: GoogleFonts.robotoMono(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "${url.format} • ${url.sizeString} • 13 days ago • 350 days left",
                style: GoogleFonts.robotoMono(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
