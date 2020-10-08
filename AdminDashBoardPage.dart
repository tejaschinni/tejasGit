import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Constant.dart';
import 'package:my_app/Maintain/AuthPage.dart';
import 'package:my_app/Data/AdminData.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/Maintain/ownerListPage.dart';

class AdminDashBoardPage extends StatefulWidget {
  final Function handleSignOut;
  final FirebaseUser fireBaseUser;
  AdminDashBoardPage({this.handleSignOut, this.fireBaseUser});
  @override
  _AdminDashBoardPageState createState() => _AdminDashBoardPageState();
}

class _AdminDashBoardPageState extends State<AdminDashBoardPage> {
  FirebaseUser user;
  String userEmail;
  AdminData record;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cFireBaseAuth.currentUser().then((user) => setState(() {
          this.user = user;
          userEmail = user.email;
        }));
    loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.outlined_flag),
          onPressed: () {
            widget.handleSignOut();
          }),
      appBar: AppBar(
        title: Text('DashBoard'),
      ),
      body: DelayedDisplay(
        delay: Duration(seconds: 2),
        child: Center(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.all(20),
                  child: RaisedButton(
                      child: Text('Owner List'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OwnerListPage(
                                    fireBaseUser: widget.fireBaseUser,
                                    record: record,
                                    handleSignOut: widget.handleSignOut,
                                    loadRecordItems: loadItems)));
                      })),
              Container(
                  margin: EdgeInsets.all(20),
                  child: RaisedButton(
                      child: Text('SignOut'),
                      onPressed: () {
                        widget.handleSignOut();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AuthPage()));
                      })),
            ],
          ),
        ),
      ),
    );
  }

  loadItems() {
    print('--------------- get data-----------');
    Firestore.instance
        .collection('maintain')
        .document(widget.fireBaseUser.email.toString())
        .get()
        .then((DocumentSnapshot ds) {
      setState(() {
        record = AdminData.fromSnapshot(ds);
      });
    });
  }
}
