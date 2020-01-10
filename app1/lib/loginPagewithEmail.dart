import 'package:app1/googleDemoSignOut.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginPageWithEmail extends StatefulWidget {
  @override
  _LoginPageWithEmailState createState() => _LoginPageWithEmailState();
}

class _LoginPageWithEmailState extends State<LoginPageWithEmail> {
  FirebaseUser user;
  GoogleSignInAccount _currentUser;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController emailController1 = TextEditingController();
  TextEditingController passController1 = TextEditingController();

  String ans='';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
    });
    print(_currentUser);
    _googleSignIn.signInSilently();
  }

  Future<FirebaseUser> handleSignInEmail(String email ,String password)async{
   try{
      AuthResult result =await auth.signInWithEmailAndPassword(email: email ,password: password);
    final FirebaseUser user = result.user;

    assert(user != null);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await auth.currentUser();
    assert(user.uid == currentUser.uid);

    print("SignIn Succeeded ");

    setState(() {
      ans = 'Sign In Complete';
    });

    return user;
   }
   catch(e){
     setState(() {
       ans = e.toString();
     });
     return null;
   }
  }

  Future<FirebaseUser> handleSignUp(email,password)async{
    // AuthResult result =await auth.createUserWithEmailAndPassword(email: email ,password: password);
    // final FirebaseUser user = result.user;

    // assert(user != null);
    // assert(await user.getIdToken() != null);

    // print("Sign Up");

    // return user;
    try{
    AuthResult result =await auth.createUserWithEmailAndPassword(email: email ,password: password);
    final FirebaseUser user = result.user;

    assert(user != null);
    assert(await user.getIdToken() != null);

    print("Sign Up");
    setState(() {
      ans = 'Sign Up';
    });

    return user;
    }
    catch(e){
      setState(() {
        ans = e.toString();
      });
      return null;
    }
  }

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


  void signWithEmail(){
    showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Form(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller: emailController,                              
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                                )
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller: passController,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.vpn_key),
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                                )
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              child: Text("Submit"),
                              onPressed: () {
                               handleSignInEmail(emailController.text, passController.text);
                               emailController.text = '';
                               passController.text = '';
                               Navigator.pop(context);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login With Email")
      ),
      body: Container(
        margin: EdgeInsets.all(25),
        child: Center(
          child: ListView(
            children: <Widget>[
              RaisedButton(
                onPressed: (){
                  setState(() {
                    signWithEmail();
                  });
                },
                child: Text("SignIn  Email"),
              ),
              SizedBox(height: 100,),
              RaisedButton(
                onPressed: (){
                   setState(() {
                    _handleSignIn();
                  });
                },
                child: Text("Sign In"),
              ),
              SizedBox(height: 100,),
              RaisedButton(
                onPressed: (){
                  setState(() {
                   showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Form(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller: emailController1,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                labelText: 'Email',
                                
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                                )
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller: passController1,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.vpn_key),
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                                )
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              child: Text("Submit"),
                              onPressed: () {
                               handleSignUp(emailController1.text, passController1.text);
                               emailController1.text = '';
                               passController1.text = '';
                               Navigator.pop(context);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
                  });
                },
                child: Text("Sign Up"),
              ),
              SizedBox(height: 100,),
              Container(
                margin: EdgeInsets.all(25),
                child: Center(
                  child: Text(ans),
                ),
              )
            ],
          ),
        ),
      ),      
    );

  }
}