// Copyright 2019 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:convert' show json;

import 'package:app1/googleDemoSignOut.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',    
  ],
);

class SignInDemoGoogle extends StatefulWidget {
  @override
  State createState() => SignInDemoGoogleState();
}

class SignInDemoGoogleState extends State<SignInDemoGoogle> {
  GoogleSignInAccount _currentUser;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
    });
    print(_currentUser);
    _googleSignIn.signInSilently();
  }



  // Future<void> _handleSignIn() async {
  //   try {
  //     await _googleSignIn.signIn();
  //     if(_currentUser!=null)
  //     {
  //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GoogleSignOutDemo(_handleSignOut,_currentUser)));
  //     }
  //   } catch (error) {
  //     print(error);
      

  //   }
  // }
  Future<FirebaseUser> _handleSignIn() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GoogleSignOutDemo(_handleSignOut,_currentUser)));

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
  print("signed in " + user.displayName);
  return user;
  
}

  Future<void> _handleSignOut() => _googleSignIn.disconnect();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Google Sign In'),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: RaisedButton(
            child: const Text('SIGN IN'),
            onPressed: _handleSignIn,
          ),
        ));
  }
}