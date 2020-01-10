import 'package:app1/constant.dart';
import 'package:app1/googleDemoSign.dart';
import 'package:app1/loginPagewithEmail.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignOutDemo extends StatefulWidget {
  final Function signOut;
  final GoogleSignInAccount _currentUser;

  GoogleSignOutDemo(this.signOut,this._currentUser);
  @override
  _GoogleSignOutDemoState createState() => _GoogleSignOutDemoState();
}

class _GoogleSignOutDemoState extends State<GoogleSignOutDemo> {
  
  FirebaseUser user;
  String photoUrl;

  final String _simpleValue1 = 'Menu item value one';
  final String _simpleValue2 = 'Menu item value two';
  final String _simpleValue3 = 'Menu item value three';
  String _simpleValue;

  void showMenuSelection(String value) {
    if (<String>[_simpleValue1, _simpleValue2, _simpleValue3].contains(value))
      _simpleValue = value;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _simpleValue = _simpleValue2;
    cFireBaseAuth.currentUser().then((user)=>setState((){
      this.user=user;
      photoUrl = user.photoUrl;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google SignOut"),
        actions: <Widget>[
          Container(
            child: PopupMenuButton<String>(
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Preview',
                  child: ListTile(
                    leading: Icon(Icons.visibility),
                    title: Text('Preview'),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'SignOut',
                  child: ListTile(
                    leading: Icon(Icons.person_add),
                    title: Text('SignOut'),
                  ),
                ),
              ],
              onSelected: (String s) {
                print(s);
                if (s == 'SignOut') {
                  widget.signOut();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginPageWithEmail()));
                }
              },
            ),
          )
        ],
      ),
      body: Container(
        child: Center(
            child: ListView(
          children: <Widget>[
          //   ListTile(
          //  title: CircleAvatar(
          //    backgroundImage: NetworkImage(photoUrl),
          //  )
            //),
            
          ],
        )),
      ),
    );
  }
}
