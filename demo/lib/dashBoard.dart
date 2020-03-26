import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DashBoard extends StatefulWidget {
  
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pushData();

  }
  void pushData() async {
   await   Firestore.instance.collection('books').document()
  .setData({ 'title': 'Tejas', 'author': 'hjhjkkl' });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DashBoard'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () {},
            child: Text('Sig Out'),
          ),
        ),
      ),
    );
  }
}
