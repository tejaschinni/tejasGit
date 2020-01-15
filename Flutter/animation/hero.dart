import 'package:flutter/material.dart';
import 'package:newapp1/animation/hero2.dart';

class HeroDemo extends StatefulWidget {
  @override
  _HeroDemoState createState() => _HeroDemoState();
}

class _HeroDemoState extends State<HeroDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Demo"),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> HeroDemo2()));
            },
            child: Container(
              child: Hero(
                tag: "animdemo",
                child: Icon(Icons.play_arrow,size: 200),
                
              ),
            ),
          ),
          )
        ),
      ),
    );
  }
}
