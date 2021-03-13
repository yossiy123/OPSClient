import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FieldCustomWidget extends StatelessWidget {
  const FieldCustomWidget({
    Key key,
    @required this.focusNode,
    this.secureText = false,
    this.hintText,
    @required this.labelText,
  }) : super(key: key);

  final FocusNode focusNode;
  final bool secureText;
  final String hintText;
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      maxLength: 20,
      maxLines: 1,
      obscureText: secureText,
      decoration: InputDecoration(
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
        hintStyle: TextStyle(fontSize: 12),
        hintText: hintText,
        labelStyle: (GoogleFonts.redressed(
            fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
        labelText: labelText,
      ),
    );
  }
}