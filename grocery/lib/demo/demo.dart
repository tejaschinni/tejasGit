import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery/auth.dart';
import 'package:grocery/contant.dart';
import 'package:grocery/data/owner.dart';
import 'package:grocery/data/shopOwner.dart';

class Demo extends StatefulWidget {
  final Function _handleSignOut;
//  final GoogleSignInAccount _currentUser;
  Demo(this._handleSignOut);
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  FirebaseUser user;
  ShopOwner owner;
  String userEmail, documentName ,documentName1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      
    setState(() {
      cFireBaseAuth.currentUser().then((user) => setState(() {
          this.user = user;

          userEmail = user.email;
        }));
      // userEmail = widget._currentUser.email;
    loadOnwerData();
    fectchItemsData();
    });
  }

  void loadOnwerData() async {
    Firestore.instance
        .collection('ShopOwner')
        .document(user.email)
        .get()
        .then((DocumentSnapshot ds) {
      // print('---------------------'+user.displayName);
      print(ds.documentID);

      
    });

    // Firestore.instance.collection('Owner').document(userEmail).get().then((DocumentSnapshot ds){
    
    // });
  }

  void fectchItemsData() async {
    final QuerySnapshot result =
        await Firestore.instance.collection('ShopOwner').getDocuments();

    final List<DocumentSnapshot> document = result.documents;
    document.forEach((data) {
      owner = ShopOwner.fromSnapshot(data);
      print(owner.shoplicense);
      documentName = data.documentID.toString();
      documentName1 = owner.shopaddress;
      //name = owner.ownerName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(userEmail),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(documentName.toString()),
                ),

                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(documentName1.toString()),
                ),
                Container(
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        widget._handleSignOut();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AuthPage()));
                      });
                    },
                    child: Text("Sign Out "),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
