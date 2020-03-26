import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery/contant.dart';
import 'package:grocery/shopOwner/ownerDashBoard.dart';

class RegisterOwnerProfile extends StatefulWidget {

  final Function handleSignOut;
  RegisterOwnerProfile(this.handleSignOut);
  @override
  _RegisterOwnerProfileState createState() => _RegisterOwnerProfileState();
}

class _RegisterOwnerProfileState extends State<RegisterOwnerProfile> {
  FirebaseUser user;

  String userEmail;
  String shopName, ownerName, mobile, shopAddress, shopLicense;

  TextEditingController shopNameController = TextEditingController();
  TextEditingController ownerNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController shopAddressController = TextEditingController();
  TextEditingController shopLicenseController = TextEditingController();

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
            Navigator.push(context, MaterialPageRoute(builder: (contex)=>OwnerDashBoard(widget.handleSignOut)));
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
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: shopNameController,
                onChanged: (String s) {
                  setState(() {
                    shopName = s;
                  });
                },
                decoration: InputDecoration(hintText: '*Name Of Shop'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: ownerNameController,
                onChanged: (String s) {
                  setState(() {
                    ownerName = s;
                  });
                },
                decoration: InputDecoration(hintText: '*Shop Owner Name'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: shopAddressController,
                onChanged: (String s) {
                  setState(() {
                    shopAddress = s;
                  });
                },
                decoration: InputDecoration(hintText: '*Shop Address'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: mobileController,
                onChanged: (String s) {
                  setState(() {
                    mobile = s;
                  });
                },
                decoration: InputDecoration(hintText: '*Shop Phone No.'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: shopLicenseController,
                onChanged: (String s) {
                  setState(() {
                    shopLicense = s;
                  });
                },
                decoration: InputDecoration(hintText: '*Shop Act license no.'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void insert() {
    Firestore.instance
        .collection('Owner')
        .document(userEmail)
        .setData({
      'shopName': shopName,
      'ownerName': ownerName,
      'mobile': mobile,
      'shopAddress': shopAddress,
      'shopLicense': shopLicense,
    });
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
