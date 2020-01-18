import 'package:flutter/material.dart';
import 'package:project1/authPage.dart';
import 'package:project1/demo/clippingToolDemo.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
           home: ClippingToolDemo(),
    );
  }
}
