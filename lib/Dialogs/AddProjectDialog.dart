import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddProjectDialog extends StatelessWidget {
  const AddProjectDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBarTheme(
      data: ButtonBarThemeData(alignment: MainAxisAlignment.center),
      child: AlertDialog(
        backgroundColor: Colors.teal[200],
        scrollable: true,
        title: Center(
          child: Text("Add Open Source Project",
              style: GoogleFonts.redressed(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
        ),
        content: Form(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: 25), // for padding the textfields
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(
                    0.8, 0.0), // 10% of the width, so there are ten blinds.
                colors: [
                  Colors.lightBlue[100],
                  Colors.lightGreen[100]
                ], // red to yellow
                tileMode: TileMode.repeated,
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.70,
            child: Column(children: [
              SizedBox(
                height: 5,
              ),
              TextFormField(
                onChanged: (value) {
                  // get name
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24)),
                    labelText: "Title",
                    icon: Icon(Icons.title)),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                onChanged: (value) {
                  // get description
                },
                maxLines: 30,
                maxLength: 1000,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24)),
                    labelText: "Info",
                    icon: Icon(Icons.info_outline)),
              ),
            ]),
          ),
        ),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.green, minimumSize: Size(80, 50)),
              child: Text("Submit"),
              onPressed: () {
                // your code

                Navigator.pop(context);
              }),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.red, minimumSize: Size(80, 50)),
              child: Text("Back"),
              onPressed: () {
                // your code

                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
