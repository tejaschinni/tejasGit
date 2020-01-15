import 'package:flutter/material.dart';

class RichDemo extends StatefulWidget {
  @override
  _RichDemoState createState() => _RichDemoState();
}

class _RichDemoState extends State<RichDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RichText(
          text: TextSpan(
            text: 'Hello',
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(text: ' Bold',style: TextStyle(fontWeight: FontWeight.normal)),
              TextSpan(text: ' World'),
            ]
          ),
        ),
      ),      
    );
  }
}