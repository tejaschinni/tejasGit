import 'package:flutter/material.dart';
import 'package:newapp1/Doctor/add.dart';
import 'package:newapp1/animatedContaner.dart';
import 'package:newapp1/animatedSwitcher.dart';
import 'package:newapp1/animation/hero.dart';
import 'package:newapp1/bike/bike.dart';
import 'package:newapp1/bike/owner.dart';
import 'package:newapp1/calculator/numberTriva.dart';
import 'package:newapp1/futunreBuilderDemo.dart';
import 'package:newapp1/limitedBox.dart';
import 'package:newapp1/newdemo/dogs.dart';
import 'package:newapp1/owner/ownerdashboard.dart';
import 'package:newapp1/pagecontroller.dart';
import 'package:newapp1/refershdemo.dart';
import 'package:newapp1/sql/flareDemo.dart';
import 'package:newapp1/sql/jsonDemo.dart';

import 'animation/animation.dart';
import 'calculator/dashBoard.dart';
import 'calculator/dataPickerDemo.dart';
import 'owner/richTextDemo.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

 
 MyApp();
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlareDemo(),
    );
  }
}