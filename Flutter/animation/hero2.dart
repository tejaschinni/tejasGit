import 'package:flutter/material.dart';

class HeroDemo2 extends StatefulWidget {
  @override
  _HeroDemo2State createState() => _HeroDemo2State();
}

class _HeroDemo2State extends State<HeroDemo2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: SafeArea(
        child: Container(
          child: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              child: Hero(
                tag: "animdemo",
                child: Icon(Icons.pause,size: 200,),
                
              ),
            ),
          )
        ),
      ),
    );
  }
}
