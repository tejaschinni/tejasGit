import 'package:flutter/material.dart';

class Demo1Firestore extends StatefulWidget {
  @override
  _Demo1FirestoreState createState() => _Demo1FirestoreState();
}

class _Demo1FirestoreState extends State<Demo1Firestore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firestore Demo"),
      ),
      body: Center(),
    );
  }
}
