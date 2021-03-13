import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:focus_widget/focus_widget.dart';
import 'package:ospclient/Widgets/textFieldCustomWidget.dart';

//  Navigator.pop(context);

class LoginPage extends StatelessWidget {
  static const String route = '/login';
  final FocusNode userFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FocusWidget(
                focusNode: userFocusNode,
                child: FieldCustomWidget(
                  focusNode: userFocusNode,
                  hintText: "Type UserName",
                  labelText: "User",
                ),
              ),
              FocusWidget(
                focusNode: passwordFocusNode,
                child: FieldCustomWidget(
                  focusNode: passwordFocusNode,
                  secureText: true,
                  hintText: "Type password",
                  labelText: "Password",
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Back To Main Page",
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
