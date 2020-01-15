import 'package:flutter/material.dart';

class AnimatedContanerDemo extends StatefulWidget {
  @override
  _AnimatedContanerDemoState createState() => _AnimatedContanerDemoState();
}

class _AnimatedContanerDemoState extends State<AnimatedContanerDemo> {
  bool  selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: GestureDetector(
            onTap: (){
              setState(() {
                selected = !selected;
              });
            },
            child: Center(
              child: AnimatedContainer(
                width: selected? 200.0:100.0,
                height: selected?100.0:200.0,
                color: selected?Colors.red:Colors.blue,
                alignment: 
                selected?Alignment.center:Alignment.topCenter,
                duration: Duration(seconds: 5),
                curve: Curves.bounceInOut,
              ),
            ),
          ),
        ),
    );
  }
}