import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class StoreBoxPage extends StatefulWidget {
  @override
  _StoreBoxPageState createState() => _StoreBoxPageState();
}

class _StoreBoxPageState extends State<StoreBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            ClipPath(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/nature.jpg',
                        ),
                        fit: BoxFit.fill)),
              ),
              clipper: BottomWaveClipper(),
            ),
            Container(
              alignment: Alignment.center,
              child: CircleAvatar(
                maxRadius: 70,
                backgroundImage: AssetImage('assets/wallpaper.jpg'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(hintText: '*Name Of Shop'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(hintText: '*Shop Owner Name'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(hintText: '*Shop Address'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(hintText: '*Shop Phone No.'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(hintText: '*Shopact license no.'),
              ),
            ),
            InkWell(
              
            )
          ],
        ),
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 110);
    path.lineTo(
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
