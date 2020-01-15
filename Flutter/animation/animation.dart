import 'package:flutter/material.dart';

class AnimationDemo extends StatefulWidget {
  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool isPlaying = false;
  @override
  
  @override
  void initState() { 
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 200));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Icon "),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
        child: IconButton(
          iconSize: 50,
          icon: AnimatedIcon(
            icon: AnimatedIcons.ellipsis_search,
            progress: _animationController,
          ),
          onPressed: ()=>_handleOnPressed(),
        ),
      ),
      )
    );
  }
  void _handleOnPressed(){
    setState(() {
      isPlaying = !isPlaying;
      isPlaying?_animationController.forward():_animationController.reverse();
    });
  }
}
