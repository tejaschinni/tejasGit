import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project1/constant.dart';
import 'package:project1/demo/demoPage.dart';


GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  GoogleSignInAccount _currentUser;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;
 FirebaseUser user ;

 @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });      
    });
    _googleSignIn.signInSilently();
    cFireBaseAuth.currentUser().then((user)=>setState((){
      this.user=user;
      // photoUrl = user.photoUrl;
    }));
  }


  Future<FirebaseUser> _handleSignIn() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
  print("signed in " + user.displayName);
  return user;
}

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/nature.jpg',),fit: BoxFit.fill
          )
        ),
        child: Center(
        child: Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.all(30),
          child: RaisedButton(
            color: Colors.redAccent,
            onPressed: () {
              _handleSignIn();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DemoPage(),));
            },
            child: Text(
              "Sign In With Google",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.redAccent)),
          ),
        ),
      ),
      )
    );
  }
}
