import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  final Function handleSignOut;
  DemoPage(this.handleSignOut);
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TestDemo Page"),),
      body: Center(
        child: Container(
          child: RaisedButton(
            child: Text("Sign Out"),
            onPressed: (){
              widget.handleSignOut();
              Navigator.pop(context);
            },
          ),
        )
      ),
    );
  }
}