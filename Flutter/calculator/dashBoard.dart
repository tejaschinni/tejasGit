import 'package:flutter/material.dart';
import 'package:newapp1/calculator/numberTriva.dart';

class DashBoardpage extends StatefulWidget {
  @override
  _DashBoardpageState createState() => _DashBoardpageState();
}

class _DashBoardpageState extends State<DashBoardpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Number Fact"),
      ),
      body: Center(
          child: Expanded(
        child: RaisedButton(
          child: Text("Number"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NumberTrivaDemo()));
          },
        ),
      ),
      ),
    );
  }
}
