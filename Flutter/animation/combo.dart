import 'package:flutter/material.dart';
import 'package:newapp1/animation/hero2.dart';

class Combodemo extends StatefulWidget {
  @override
  _CombodemoState createState() => _CombodemoState();
}

class _CombodemoState extends State<Combodemo>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  }

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
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HeroDemo2()));
            },
            child: Container(
              child: Hero(
                tag: "animdemo",
                child: IconButton(
                  iconSize: 50,
                  icon: AnimatedIcon(
                    icon: AnimatedIcons.ellipsis_search,
                    progress: _animationController,
                  ),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>HeroDemo2()))
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }

  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }
}

