import 'package:flutter/material.dart';
import 'package:sportcred/UI/LoginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SportCred',
      theme: ThemeData(
        primaryColor: Color(0xFF222629),
      ),
      home: LoginPage(),
    );
  }
}
