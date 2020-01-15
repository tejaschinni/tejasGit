import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class FlareDemo extends StatefulWidget {
  @override
  _FlareDemoState createState() => _FlareDemoState();
}

class _FlareDemoState extends State<FlareDemo> {
  String anim = "tohappy";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flare Demo'),
      ),
      body: Container(
        child: InkWell(
          onTap: (){
            setState(() {
              if(anim == "tohappy"){
                anim = "tosad";
              }
              else{
                anim = "tohappy";
              }
            });
          },
                  child: FlareActor("assets/Smiley.flr",
              alignment: Alignment.center,
              fit: BoxFit.contain,
              animation: anim),
        ),
      ),
    );
  }
}
