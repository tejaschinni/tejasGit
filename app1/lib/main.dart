
import 'package:app1/googleDemoSign.dart';
import 'package:app1/loginPagewithEmail.dart';
import 'package:app1/loginWithEmail.dart';
import 'package:app1/menu.dart';
import 'package:app1/orgnal.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPageWithEmail(),           
    );
  }
}
