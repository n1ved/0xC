import 'package:flutter/material.dart';
import 'package:nullcompanion/components/upload_sheet.dart';
import 'package:nullcompanion/constants/const.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return UploadSheet();
                },
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              iconColor: Colors.black,
              textStyle: TextStyle(color: Colors.black),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              spacing: 5.0,
              children: [
                Icon(Icons.upload),
                Text("Upload File", style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              iconColor: Colors.black,
              textStyle: TextStyle(color: Colors.black),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              spacing: 5.0,
              children: [
                Icon(Icons.add),
                Text("Copy URL", style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
          IconButton.filledTonal(
            onPressed: () {},
            icon: Icon(Icons.settings),
            style: IconButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.black,
            ),
          ),
          IconButton.filledTonal(
            onPressed: () {},
            icon: Icon(Icons.info_outline),
            style: IconButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
