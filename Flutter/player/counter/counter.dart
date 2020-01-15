import 'package:flutter/material.dart';

class Count extends StatefulWidget {
  @override
  _CountState createState() => _CountState();
}

class _CountState extends State<Count> {
  int counters;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Scaffold(
        body: SafeArea(
          
          child: Text("Counter"),
          


        ),
      ),
      
    );
  }
}