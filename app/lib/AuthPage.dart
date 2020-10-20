import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_app/maintain/AdminDashBoardPage.dart';
import 'package:my_app/maintain/AuthPage.dart';

import '../Constant.dart';

// NOTE: to add firebase support, first go to firebase console, generate the
// firebase json file, and add configuration lines in the gradle files.
// C.f. this commit: https://github.com/X-Wei/flutter_catalog/commit/48792cbc0de62fc47e0e9ba2cd3718117f4d73d1.
class AuthPage extends StatefulWidget {
  const AuthPage({Key key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  FirebaseUser _user;
  bool status = false;
  // If this._busy=true, the buttons are not clickable. This is to avoid
  // clicking buttons while a previous onTap function is not finished.
  bool _busy = false, processing = false, validSakUser = false;
  String msg = 'Signing in with google';

  @override
  void initState() {
    super.initState();
    setState(() {
      processing = true;
      signOut();
      processing = false;
    });
  }

  // Future<void> getProfileStatus() async {
  //   Firestore.instance
  //       .collection('maintain')
  //       .document(_user.email)
  //       .get()
  //       .then((DocumentSnapshot ds) {
  //     setState(() {
  //       status = ds['active'];
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final avatar = CircleAvatar(
        backgroundImage: NetworkImage(
            _user != null
                ? _user.photoUrl
                : 'https://i.pinimg.com/originals/51/f6/fb/51f6fb256629fc755b8870c801092942.png',
            scale: 1.0));

    final googleLoginBtn = _user != null
        ? SizedBox()
        : Column(
            children: <Widget>[
              Text(
                'Login With Google',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                animationDuration: Duration(milliseconds: 500),
                hoverElevation: 11,
                color: Colors.grey[200],
                elevation: 5,
                child: ListTile(
                  leading: Icon(
                    Icons.access_alarm,
                    color: Colors.red,
                  ),
                  title: Text(
                    'Log in with Google',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                onPressed: this._busy
                    ? null
                    : () async {
                        if (_user == null) {
                          setState(() {
                            this._busy = true;
                            this.processing = true;
                          });
                          final user = await this._googleSignIn();
                          setState(() {
                            this._busy = false;
                          });

                          isSakRegisteredAccount();
                        } else {
                          print('already user present');
                        }
                      },
              ),
            ],
          );

    final gap = SizedBox(height: 20);

    final yourProfile = _user != null && status
        ? MaterialButton(
            color: Colors.cyan[50],
            elevation: 5,
            child: ListTile(
              leading: avatar,
              title: Text(
                'Click to Continue',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              trailing: Icon(Icons.navigate_next),
            ),
            onPressed: () async {
              setState(() {
                processing = true;
                msg = 'Going to Dashboard';
              });
              Timer(const Duration(seconds: 2), () {
                setState(() {
                  processing = true;
                });

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdminDashBoardPage(
                              fireBaseUser: _user,
                              handleSignOut: signOut,
                            )));
              });
            },
          )
        : SizedBox();

    return _user == null
        ? Scaffold(
            body: SafeArea(
            child: Stack(
              children: <Widget>[
                Container(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    DelayedDisplay(
                      delay: Duration(seconds: 1),
                      child: Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 10),
                        height: MediaQuery.of(context).size.height / 2.1,
                        // child: Image.asset('assets/slider0.png'),
                      ),
                    ),
                    processing
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: CircularProgressIndicator(),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Text(
                                  msg,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black38,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          )
                        : Container(
                            margin: EdgeInsets.only(left: 60, right: 60),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                DelayedDisplay(
                                    delay: Duration(milliseconds: 500),
                                    child: yourProfile),
                                googleLoginBtn,
                                gap,
                              ],
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ))
        : AdminDashBoardPage(
            handleSignOut: signOut,
            fireBaseUser: _user,
          );
  }

  // Sign in with Google.
  Future<FirebaseUser> _googleSignIn() async {
    final curUser = this._user ?? await FirebaseAuth.instance.currentUser();
    if (curUser != null && !curUser.isAnonymous) {
      return curUser;
    }
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Note: user.providerData[0].photoUrl == googleUser.photoUrl.
    final user =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;

    setState(() => this._user = user);

    return user;
  }

  Future<Null> signOut() async {
    setState(() {
      validSakUser = false;
    });
    FirebaseAuth.instance.signOut();
    await cGoogleSignIn.signOut();
    setState(() => this._user = null);
  }

  // Future<Void> signInWithGoogle() async {
  //   final GoogleSignInAccount googleSignInAccount =
  //       await cGoogleSignIn.signIn();
  //   final GoogleSignInAuthentication googleSignInAuthentication =
  //       await googleSignInAccount.authentication;

  //   final AuthCredential credential = GoogleAuthProvider.getCredential(
  //     accessToken: googleSignInAuthentication.accessToken,
  //     idToken: googleSignInAuthentication.idToken,
  //   );

  //   final AuthResult authResult =
  //       await FirebaseAuth.instance.signInWithCredential(credential);
  //   final FirebaseUser user = authResult.user;

  //   assert(!user.isAnonymous);
  //   assert(await user.getIdToken() != null);

  //   final FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
  //   assert(user.uid == currentUser.uid);
  // }

  void isSakRegisteredAccount() {
    print('isSakRegisteredAccount method called');
    setState(() {
      processing = true;
      msg = 'Ckecking SAK Account';
    });
    print(_user.email);
    String documentPath = '/maintain/${_user.email.toString()}';
    print("${documentPath}_____________---------${_user.email}");

    Firestore.instance
        .document(documentPath)
        .get()
        .then((DocumentSnapshot doc) {
      if (doc.exists) {
        //getProfileStatus();
        setState(() {
          validSakUser = true;
          print("________FOUND_______${documentPath}___");

          print(status);
          // Navigator.pushReplacement(
          //     context, MaterialPageRoute(builder: (context) => Dashboard()));
        });
      } else {
        setState(() {
          validSakUser = false;
        });
        print("________NOT FOUND_______${documentPath}___");
      }
    });
    print("______________________________________Valid SAK User = " +
        validSakUser.toString());

    if (!validSakUser) {
      print('going for registration');
    }

    setState(() {
      processing = false;
    });
  }
}
