import 'package:flutter/material.dart';
import 'package:ospclient/Screens/LoginPage.dart';
import 'package:ospclient/Screens/RegisterPage.dart';

import 'Screens/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (context) => HomePage(),
        LoginPage.route: (context) => LoginPage(),
        RegisterPage.route: (context) => RegisterPage()
      },
      title: 'Open Source Projects',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: HomePage(),
    );
  }
}
