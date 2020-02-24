import 'package:flutter/material.dart';
import 'package:project1/addItemsPage.dart';
import 'package:project1/authPage.dart';
import 'package:project1/collectionDemo/addDataForCollection.dart';
import 'package:project1/collectionDemo/listPage.dart';
import 'package:project1/collectionDemo/studentCollectionDemo/addStudent.dart';
import 'package:project1/collectionDemo/studentCollectionDemo/addStudentEdu.dart';
import 'package:project1/collectionDemo/studentCollectionDemo/studentDate.dart';
import 'package:project1/collectionDemo/studentCollectionDemo/studentList.dart';
import 'package:project1/confirmPage.dart';
import 'package:project1/customerList.dart';
import 'package:project1/dashBoardPage.dart';
import 'package:project1/demo/JsonDemo2Items.dart';
import 'package:project1/demo/cardDemo.dart';
import 'package:project1/demo/clippingToolDemo.dart';
import 'package:project1/demo/jsonExample.dart';
import 'package:project1/demo/jsonItemsDemo.dart';
import 'package:project1/demo/listWheelsDemo.dart';
import 'package:project1/demo/menuIcons.dart';
import 'package:project1/demo/orignalSignInDemo.dart';
import 'package:project1/demo/stackDemo.dart';
import 'package:project1/listOfItemPage.dart';
import 'package:project1/numberVerification.dart';
import 'package:project1/orderPage.dart';
import 'package:project1/orderViewPage.dart';

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
           home: JsonDemo2Itmes(),
    );
  }
}
