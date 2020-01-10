import 'package:app1/constant.dart';
import 'package:app1/loginPagewithEmail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInWithEmail extends StatefulWidget {
  @override
  _SignInWithEmailState createState() => _SignInWithEmailState();
}

class _SignInWithEmailState extends State<SignInWithEmail> {
  FirebaseUser user;
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController emailController1 = TextEditingController();
  TextEditingController passController1 = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<FirebaseUser> handleSignInEmail(String email ,String password)async{
    AuthResult result =await auth.signInWithEmailAndPassword(email: email ,password: password);
    final FirebaseUser user = result.user;

    assert(user != null);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await auth.currentUser();
    assert(user.uid == currentUser.uid);

    print("SignIn Succeeded ");

    return user;
  }

  Future<FirebaseUser> handleSignUp(email,password)async{
    AuthResult result =await auth.createUserWithEmailAndPassword(email: email ,password: password);
    final FirebaseUser user = result.user;

    assert(user != null);
    assert(await user.getIdToken() != null);

    print("Sign Up");

    return user;
  }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login With Email"),
      ),    
      body: Center(
        child: Container(
          child: ListView(
            children: <Widget>[
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
              TextField(
                controller: passController,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
              RaisedButton(
                onPressed: (){
                  setState(() {
                    handleSignInEmail(emailController.text, passController.text);
                  });
                },
                child: Text("Sign IN"),
              ),
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
            ],
          ),
        ),

      ),  
    );
  }
}