import 'dart:math';

import 'package:flutter/material.dart';

class LimitedBoxDemo extends StatefulWidget {
  @override
  _LimitedBoxDemoState createState() => _LimitedBoxDemoState();
}

class _LimitedBoxDemoState extends State<LimitedBoxDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            
            Container(
              color: ramdamColor(),
              height: 200,
            ),
            Container(
              color: ramdamColor(),
              height: 200,
            ),
            Container(
              color: ramdamColor(),
              height: 200,
            ),
            Container(
              color: ramdamColor(),
              height: 200,
            ),
            Container(
              color: ramdamColor(),
              height: 200,
            ),
            Container(
              color: ramdamColor(),
              height: 200,
            ),
            Container(
              color: ramdamColor(),
              height: 200,
            )
            
          ],
        ),
      ),
    );
  }
  Color ramdamColor(){
    Random randam = Random();

    int r = randam.nextInt(250);
    int g = randam.nextInt(250);
    int b = randam.nextInt(250);

    return Color.fromRGBO(r, g, b, 10);
  }
}
