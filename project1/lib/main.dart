import 'package:flutter/material.dart';
import 'package:project1/authPage.dart';
import 'package:project1/customerList.dart';
import 'package:project1/dashBoardPage.dart';
import 'package:project1/demo/cardDemo.dart';
import 'package:project1/demo/clippingToolDemo.dart';
import 'package:project1/demo/menuIcons.dart';
import 'package:project1/demo/orignalSignInDemo.dart';
import 'package:project1/demo/stackDemo.dart';
import 'package:project1/listOfItemPage.dart';
import 'package:project1/numberVerification.dart';
import 'package:project1/orderPage.dart';
import 'package:project1/orderViewPage.dart';
import 'package:project1/storeBox.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
           home: AuthPage(),
    );
  }
}
