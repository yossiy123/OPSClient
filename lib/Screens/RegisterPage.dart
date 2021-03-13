import 'package:flutter/material.dart';
import 'package:focus_widget/focus_widget.dart';
import 'package:ospclient/Widgets/textFieldCustomWidget.dart';
//  Navigator.pop(context);

class RegisterPage extends StatelessWidget {
  static const String route = '/register';

  final FocusNode userFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode rePasswordFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();

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
                focusNode: emailFocusNode,
                child: FieldCustomWidget(
                  focusNode: emailFocusNode,
                  hintText: "Type Email",
                  labelText: "Email",
                ),
              ),
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
                  hintText: "Type Password",
                  labelText: "Password",
                ),
              ),
              FocusWidget(
                focusNode: rePasswordFocusNode,
                child: FieldCustomWidget(
                  focusNode: rePasswordFocusNode,
                  secureText: false,
                  hintText: "Retype Password",
                  labelText: "Password",
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text(
                  "Register",
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
