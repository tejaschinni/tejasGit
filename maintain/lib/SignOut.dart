import 'package:flutter/material.dart';

class SignOut extends StatefulWidget {
  final Function _handleSignOut;
  SignOut(this._handleSignOut);
  @override
  _SignOutState createState() => _SignOutState();
}

class _SignOutState extends State<SignOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignOut'),
      ),
      body: Center(
          child: Container(
        child: RaisedButton(
            child: Text('Signout'),
            onPressed: () {
              widget._handleSignOut;
              Navigator.pop(context);
            }),
      )),
    );
  }
}
