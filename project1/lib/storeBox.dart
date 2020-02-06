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
  File _image1;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future storeImage() async {
    var image1 = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image1 = image1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Profile"),
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
            InkWell(
              onTap: () {
                setState(() {
                  storeImage();
                });
              },
              child: ClipPath(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  // decoration: BoxDecoration(
                  //     color: Colors.black,
                  //     image: DecorationImage(
                  //         image: AssetImage(
                  //           'assets/wallpaper.jpg',
                  //         ),
                  //         fit: BoxFit.fill)),
                  child: _image1 == null
                      ? Text(
                          'Store Image.',
                        )
                      : Image.file(
                          _image1,
                          fit: BoxFit.fill,
                        ),
                ),
                clipper: BottomWaveClipper(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 150),
              child: Container(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  backgroundColor: Colors.yellow,
                    maxRadius: 70,
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          getImage();
                        });
                      },
                                            child: _image == null
                          ? Text('No image selected.')
                          : CircleAvatar(
                              backgroundImage: FileImage(
                                _image,
                              ),
                              maxRadius: 60,
                            ),
                    ))
                    ,
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
