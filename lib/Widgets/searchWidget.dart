import 'dart:ui';
import 'package:focus_widget/focus_widget.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTitle extends StatefulWidget {
  @override
  _SearchTitleState createState() => _SearchTitleState();
}

class _SearchTitleState extends State<SearchTitle> {
  String searchInput = "";
  //var _controller = TextEditingController();
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 33,
        child: FocusWidget(focusNode: myFocusNode, child: createTextField()),
      ),
    );
  }

  TextField createTextField() {
    return TextField(
      focusNode: myFocusNode,
      //controller: _controller,
      onSubmitted: (value) {
        myFocusNode.requestFocus();
      },
      //focusNode: focus,
      maxLength: 100,
      maxLines: 1,
      style: TextStyle(color: Colors.black),
      onChanged: (value) {
        searchInput = value;
      },
      mouseCursor: MaterialStateMouseCursor.clickable,
      cursorColor: Colors.black,
      decoration: InputDecoration(
          counterText: "",
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
          hintStyle: TextStyle(fontSize: 12),
          hintText: 'Search your projects',
          labelStyle: (GoogleFonts.redressed(
              fontSize: 22,
              color: Colors.black,
              backgroundColor: Colors.teal,
              fontWeight: FontWeight.bold)),
          labelText: "Open Source Projects",
          suffixIcon: IconButton(
            color: Colors.black,
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(18)),
    );
  }
}
