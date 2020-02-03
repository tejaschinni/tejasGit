import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:project1/authPage.dart';
import 'package:project1/demo/demoPage.dart';
import 'package:image_picker/image_picker.dart';

class StoreBoxPage extends StatefulWidget {
  @override
  _StoreBoxPageState createState() => _StoreBoxPageState();
}

class _StoreBoxPageState extends State<StoreBoxPage> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Profile"),
        actions: <Widget>[
          InkWell(
            onTap: (){
              setState(() {
                getImage();
              });
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: Icon(Icons.image),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          child: InkWell(
        onTap: () {},
        child: Container(
          height: 40,
          color: Colors.green,
          child: Center(
              child: Text(
            "Prossed to Continue",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          )),
        ),
      )),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ClipPath(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/wallpaper.jpg',
                        ),
                        fit: BoxFit.fill)),
              ),
              clipper: BottomWaveClipper(),
            ),
            Container(
              margin: EdgeInsets.only(top: 150),
              child: Container(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  maxRadius: 70,
                  child: _image == null
                      ? Text('No image selected.')
                      : CircleAvatar(
                        maxRadius: 60,
                        child: Image.file(_image,fit: BoxFit.cover,),
                      )
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 170),
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.center,
                padding: EdgeInsets.only(top: 140),
                children: <Widget>[
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
                      decoration:
                          InputDecoration(hintText: '*Shop Act license no.'),
                    ),
                  ),
                ],
              ),
            ),
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
