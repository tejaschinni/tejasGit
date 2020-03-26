import 'dart:async';
import 'dart:convert' show json;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery/contant.dart';
import 'package:grocery/demo/demo.dart';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn();

class SignInG extends StatefulWidget {
  @override
  State createState() => SignInGState();
}

class SignInGState extends State<SignInG> {
  GoogleSignInAccount _currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await cFireBaseAuth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:  Center(
        
        child: InkWell(
          onTap: (){
            _handleSignIn();
            setState(() {
           //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Demo(_handleSignOut,_currentUser)));
            });
          },
        
          child: Container(
              height: 53,
              width: 250,
              margin: EdgeInsets.only(top: 17),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 64, 76, 1),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Center(
                child: Text(
                  'Sign In with Google',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )),
        ),
      ),
    );
  }
}
