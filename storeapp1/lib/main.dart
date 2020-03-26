import 'package:flutter/material.dart';
import 'package:storeapp1/customer/createCustomer.dart';
import 'package:storeapp1/owner/ownerDashBoard.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OwnerDashBoard(),
    );
  }
} 