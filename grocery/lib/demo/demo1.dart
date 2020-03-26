import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery/data/owner.dart';

import '../contant.dart';

class Demo1 extends StatefulWidget {
  final Function _handleSignOut;
// GoogleSignInAccount _currentUser;
  Demo1(this._handleSignOut);
  @override
  _Demo1State createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {
  FirebaseUser user;
  Owner owner;
  String userEmail, firstName, documentName1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     cFireBaseAuth.currentUser().then((user) => setState(() {
            this.user = user;
           userEmail = user.email;
          }));
    setState(() {
     
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Owner Details '),
        ),
        body: StreamBuilder(
            stream: Firestore.instance
                .collection('Owner')
                .document(user.email)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return new Text("Loading");
              }
              var userDocument = snapshot.data;
              
              return Center(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: ListView(
                    children: <Widget>[
                      Container(
                        child: Text(userDocument["ownerName"],style: TextStyle(fontSize: 18),),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                        Container(
                        child: Text(userDocument["shopName"].toString(),style: TextStyle(fontSize: 18),),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                        Container(
                        child: Text(userDocument["shopAddress"],style: TextStyle(fontSize: 18),),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                        Container(
                       child: Text(userDocument["shopLicense"],style: TextStyle(fontSize: 18),),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                        Container(
                        child: Text(userDocument["mobile"],style: TextStyle(fontSize: 18),),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
