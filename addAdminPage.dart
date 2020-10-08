import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Maintain/AuthPage.dart';

class AddAdminPage extends StatefulWidget {
  final Function handleSignOut;
  final FirebaseUser fireBaseUser;
  AddAdminPage({this.handleSignOut, this.fireBaseUser});
  @override
  _AddAdminPageState createState() => _AddAdminPageState();
}

class _AddAdminPageState extends State<AddAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Admin'),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.outlined_flag),
          onPressed: () {
            widget.handleSignOut();
          }),
      body: Center(),
    );
  }
}
