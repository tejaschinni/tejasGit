import 'package:flutter/material.dart';

class MenuIconsPage extends StatefulWidget {
  @override
  _MenuIconsPageState createState() => _MenuIconsPageState();
}

class _MenuIconsPageState extends State<MenuIconsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipPath(
              child: Container(
                height: 30,
                color: Colors.red,
              ),
              clipper: DawerI1(),
            ),
            SizedBox(
              height: 5,
            ),
            ClipPath(
              child: Container(
                height: 30,
                color: Colors.green,
              ),
              clipper: DawerI2(),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

class DawerI1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(size.width /2, 0);
    path.lineTo(
      size.width / 2,
      size.height,
    );
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class DawerI2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(size.width /3, 0);
    path.lineTo(
      size.width / 4,
      size.height,
    );
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
