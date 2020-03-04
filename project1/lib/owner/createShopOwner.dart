import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project1/authPage.dart';
import 'package:project1/constant.dart';
import 'package:project1/demo/demoPage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project1/selectItemsList.dart';

class CreateShopOwner extends StatefulWidget {
  final Function handleSignOut;
  final GoogleSignInAccount _currentUser;
  CreateShopOwner(this.handleSignOut, this._currentUser);
  @override
  _CreateShopOwnerState createState() => _CreateShopOwnerState();
}

class _CreateShopOwnerState extends State<CreateShopOwner> {
  File _image;
  File _image1;

  FirebaseUser user;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String userEmail;
  String shopname,shopowner,shopmobile,shopaddress,shoplicense;

  TextEditingController shopnameController = TextEditingController();
  TextEditingController shopownerController = TextEditingController();
  TextEditingController shopmobileController = TextEditingController();
  TextEditingController shopaddressController = TextEditingController();
  TextEditingController shoplicenseController = TextEditingController();


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
  void initState() {
    // TODO: implement initState
    super.initState();
    cFireBaseAuth.currentUser().then((user) => setState(() {
          this.user = user;
          userEmail = user.email;
        }));
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
        onTap: () {
          setState(() {
            insert();
           Navigator.push(context, MaterialPageRoute(builder: (contex)=>SelectItemPage(widget.handleSignOut, widget._currentUser)));
          });
        },
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
                      controller: shopnameController,
                      onChanged: (String s){
                        setState(() {
                          shopname = s;
                        });
                      },
                      decoration: InputDecoration(hintText: '*Name Of Shop'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: shopownerController,
                      onChanged: (String s){
                        setState(() {
                          shopowner = s;
                        });
                      },
                      decoration: InputDecoration(hintText: '*Shop Owner Name'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: shopaddressController,
                      onChanged: (String s){
                        setState(() {
                          shopaddress = s;
                        });
                      },
                      decoration: InputDecoration(hintText: '*Shop Address'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: shopmobileController,
                      onChanged: (String s){
                        setState(() {
                          shopmobile = s;
                        });
                      },
                      decoration: InputDecoration(hintText: '*Shop Phone No.'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: shoplicenseController,
                      onChanged: (String s){
                        setState(() {
                          shoplicense = s;
                        });
                      },
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
   void insert() {
    Firestore.instance.collection('ShopOwner').document(userEmail).setData(
        {'Shopname': shopname, 'shopowner': shopowner, 'shopmobile': shopmobile, 'shopaddress': shopaddress,'shoplicense':shoplicense});
    print("Created");
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