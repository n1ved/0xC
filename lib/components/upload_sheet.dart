import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nullcompanion/constants/const.dart';
import 'package:nullcompanion/main.dart';

class UploadSheet extends StatefulWidget {
  const UploadSheet({super.key, required this.uploadType});

  final UploadType uploadType;

  @override
  State<UploadSheet> createState() => _UploadSheetState();
}

class _UploadSheetState extends State<UploadSheet> {
  final nameEditingController = TextEditingController();
  final sourceURLEditingController = TextEditingController();
  @override
  void dispose() {
    nameEditingController.dispose();
    sourceURLEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(12.0),
          topEnd: Radius.circular(12.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 10.0,
            children: [
              widget.uploadType == UploadType.upload
                  ? TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: containerGrey,
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.all(12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text(
                      'Select File',
                      style: GoogleFonts.robotoMono(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                  : UploadSheetTextField(
                    nameEditingController: sourceURLEditingController,
                    label: 'Source URL',
                  ),
              UploadSheetTextField(
                nameEditingController: nameEditingController,
                label: 'File Name',
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.black,
                ),
                child: Text('Select Instance'),
              ),
              Row(
                spacing: 10.0,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.black,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 5.0,
                        children: [
                          Icon(Icons.calendar_month),
                          Text('Set Expiry'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: containerGrey,
                        foregroundColor: Colors.black,
                      ),
                      child: Text('Generate Secret URL'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 5.0,
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: primaryColor),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                  ),
                  child: Row(
                    spacing: 5.0,
                    children:
                        widget.uploadType == UploadType.upload
                            ? [Icon(Icons.upload), Text('Upload')]
                            : [Icon(Icons.copy), Text('Copy')],
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  child: Text('Cancel'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UploadSheetTextField extends StatelessWidget {
  const UploadSheetTextField({
    super.key,
    required this.nameEditingController,
    required this.label,
  });

  final TextEditingController nameEditingController;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: TextStyle(color: Colors.black45),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: primaryColor),
        ),
      ),
      controller: nameEditingController,
    );
  }
}
