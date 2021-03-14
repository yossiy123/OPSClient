import 'package:flutter/material.dart';
import 'package:focus_widget/focus_widget.dart';
import 'package:ospclient/Widgets/ContainerCustomLR.dart';
import 'package:ospclient/Widgets/TextFieldCustomWidget.dart';

//  Navigator.pop(context);

class LoginPage extends StatelessWidget {
  static const String route = '/login';
  final FocusNode userFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: CustomContainerLR(
        childrens: [
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
              "Login",
              style: TextStyle(color: Colors.blue),
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
    );
  }
}
