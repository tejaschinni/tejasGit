
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project1/authPage.dart';
import 'package:project1/constant.dart';
import 'package:project1/customer/createProfile.dart';
import 'package:project1/customer/customerDashBoard.dart';
import 'package:project1/owner/createShopOwner.dart';
import 'package:project1/ownerDashBoard.dart';
import 'package:project1/shopOwner.dart';

class ConfirmPage extends StatefulWidget {
  final Function handleSignOut;
  final String documentPath;
  final String documentPathOwner;
  final GoogleSignInAccount _currentUser;
  ConfirmPage(this.handleSignOut, this._currentUser, this.documentPath,this.documentPathOwner);
  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  String userEmail;
  TextEditingController name = TextEditingController();
  FirebaseUser user;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String customerprofile;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cFireBaseAuth.currentUser().then((user) => setState(() {
          this.user = user;
          userEmail = user.email;
        }));
    setState(() {
     
     
     // print("------Doc Path------------" + widget.documentPath);
    });
  }

  // void getCustomerEmail() {
  //   setState(() {
  //     Firestore.instance
  //         .document(widget.documentPath)
  //         .get()
  //         .then((DocumentSnapshot ds) {
  //       if (ds.exists) {
  //         print("__________true________________" + ds.documentID.toString());
  //         Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (contex) => CustomerDashBoard(
  //                     widget.handleSignOut,
  //                     widget._currentUser)));

  //       } else {
  //         print("--Email Null--  " + ds.documentID.toString());
  //         Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (context) => CreateProfilePage(
  //                     widget.handleSignOut,
  //                     widget._currentUser)));

  //       }
  //     });
  //   });
  // }

ShopOwner shopowner;
  void getShopOwnerEmail() {
    setState(() {
        print(widget.documentPathOwner);
        print(userEmail);
      Firestore.instance
          .document(widget.documentPathOwner)
          .get()
          .then((DocumentSnapshot ds) {
           setState(() {
             shopowner = ShopOwner.fromSnapshot(ds);
           });
        if (ds.exists) {
          print("__________true________________" + ds.documentID.toString());
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (contex) => DashBoardPage(
                      widget.handleSignOut,
                      widget._currentUser)));

        } else {
          print("--Email Null--  " + ds.documentID.toString());
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateShopOwner(
                      widget.handleSignOut,
                      widget._currentUser)));

        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select"),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            InkWell(
              child: ClipPath(
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
            ),
            // Container(
            //   margin: EdgeInsets.only(top: 150),
            //   child: Container(
            //     alignment: Alignment.topCenter,
            //     child: CircleAvatar(
            //         backgroundColor: Colors.yellow,
            //         maxRadius: 70,
            //         child: InkWell(
            //           onTap: () {
            //             setState(() {});
            //           },
            //         )),
            //   ),
            // ),
            Container(
              padding: EdgeInsets.only(top: 170),
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.center,
                padding: EdgeInsets.only(top: 140),
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Text(shopowner.shopname),
                  ),
                  InkWell(
                    child: Card(
                        color: Colors.red,
                        margin: EdgeInsets.all(30),
                        elevation: 30,
                        child: Container(
                          //height: 60,
                          padding: new EdgeInsets.all(20.0),
                          child: Text(
                            "Customer",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        )),
                    onTap: () {
                     // getCustomerEmail();
                    },
                  ),
                  InkWell(
                    child: Card(
                        color: Colors.red,
                        margin: EdgeInsets.all(30),
                        elevation: 30,
                        child: Container(
                          //height: 60,
                          padding: new EdgeInsets.all(20.0),
                          child: Text(
                            "Shop Owner",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        )),
                    onTap: () {
                      setState(() {
                       getShopOwnerEmail();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoardPage(widget.handleSignOut, widget._currentUser)));
                      });
                    },
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
