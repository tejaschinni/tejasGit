import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project1/confirmPage.dart';
import 'package:project1/constant.dart';
import 'package:project1/dashBoardPage.dart';
import 'package:project1/demo/demoPage.dart';

GoogleSignIn _googleSignIn = GoogleSignIn();

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  GoogleSignInAccount _currentUser;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String email = "";
  String documentpath ;
  @override
  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
        email = account.email;
        print("________________"+email);
        documentpath = '/Customer/${email.toString()}';
      });
    });
    _googleSignIn.signInSilently();
    // if (_currentUser != null) {
    //   Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) =>
    //               DashBoardPage(_handleSignOut, _currentUser)));
    // } else {
    //   // print('Log IN Failed');
    // }
  }

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ConfirmPage(_handleSignOut,_currentUser,documentpath)));

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  // Future<void> _handleSignIn() async {
  //   try {
  //     await _googleSignIn.signIn();
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.hardLight),
                image: AssetImage(
                  'assets/wallpaper.jpg',
                ),
                fit: BoxFit.fill)),
        child: Center(
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 70),
            margin: EdgeInsets.all(60),
            child: InkWell(
              child: Card(  
                color: Colors.red,
                margin: EdgeInsets.all(30),
                elevation: 30,
                child: Container(
                  //height: 60,
                  padding: new EdgeInsets.all(20.0),
                  child: Text(
                  "Sign In With Google",
                  style: TextStyle(fontSize: 18,color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                )
              ),
              onTap: () {
                _handleSignIn();
              },
            ),
          ),
        ),
      ),
    );
  }
}
