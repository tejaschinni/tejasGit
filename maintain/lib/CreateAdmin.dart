import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateAdmin extends StatefulWidget {
  @override
  _CreateAdminState createState() => _CreateAdminState();
}

class _CreateAdminState extends State<CreateAdmin> {
  String name, mobile, address;
  TextEditingController nameController = TextEditingController();

  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 170),
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          padding: EdgeInsets.only(top: 140),
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                onChanged: (String s) {
                  setState(() {
                    name = s;
                  });
                },
                decoration: InputDecoration(hintText: '*Name '),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: addressController,
                onChanged: (String s) {
                  setState(() {
                    address = s;
                  });
                },
                decoration: InputDecoration(hintText: ' Address'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: mobileController,
                onChanged: (String s) {
                  setState(() {
                    mobile = s;
                  });
                },
                decoration: InputDecoration(hintText: 'Phone No.'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: RaisedButton(child: Text('Submit'), onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }

  void insert() {
    Firestore.instance.collection('maintain/').document().setData({});
  }
}
