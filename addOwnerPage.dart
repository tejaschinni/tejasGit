import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Data/AdminData.dart';
import 'package:my_app/Maintain/AdminDashBoardPage.dart';
import 'package:my_app/Owner/ownerData.dart';
import 'package:my_app/maintain/ownerListPage.dart';

class AddOwnerPage extends StatefulWidget {
  final Function handleSignOut;
  final FirebaseUser fireBaseUser;
  AdminData record;
  final List<OwnerData> ownerList;
  final List<String> ownerRefList;
  AddOwnerPage(
      {this.fireBaseUser,
      this.handleSignOut,
      this.ownerList,
      this.ownerRefList,
      this.record});
  @override
  _AddOwnerPageState createState() => _AddOwnerPageState();
}

class _AddOwnerPageState extends State<AddOwnerPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController roomnoController = TextEditingController();
  TextEditingController familyMember = TextEditingController();
  String name, roomno, amount, members;

  List<String> temp = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('_______________ownerRefList__________________________' +
        widget.ownerList.length.toString());
    print('------------ownerRefList------------------' +
        widget.ownerRefList.toString());

    name = nameController.text;
    members = familyMember.text;
    roomno = roomnoController.text;

    setState(() {
      temp.clear();
      temp.addAll(widget.ownerRefList);
    });

    print('_______________temp__________________________' + temp.toString());
    print('-------------temp-----------------' + temp.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Owner'),
        actions: [
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                print(' ------------------- Temp Data' + temp.toString());
                print('owner List Send from' + widget.ownerList.toString());
                print(
                    'ownerRef List Send from' + widget.ownerRefList.toString());
              })
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Text(widget.record.name),
            Container(
              child: TextField(
                controller: nameController,
                onChanged: (String s) {
                  setState(() {
                    name = s;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Name'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: TextField(
                controller: roomnoController,
                onChanged: (String s) {
                  setState(() {
                    roomno = s;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Room no'),
              ),
            ),
            // Container(
            //   child: TextField(
            //     controller: familyMember,
            //     onChanged: (String s) {
            //       setState(() {
            //         members = s;
            //       });
            //     },
            //     decoration: InputDecoration(
            //         border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(10)),
            //         hintText: 'Family members'),
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            if (nameController.text.length > 3 &&
                roomnoController.text.length > 1) {
              pushData();
              nameController.text = '';
              roomnoController.text = '';
              //Navigator.pop(context);
            }
          }),
    );
  }

  updateRecord() {
    //going to update records for localhost
  }

  Future<void> pushData() async {
    final docuRef = await Firestore.instance
        .collection('maintain')
        .document(widget.fireBaseUser.email.toString())
        .collection('owner')
        .add({'name': name, 'roomno': roomno});

    // for (int i = 0; i <= widget.record.ownerRef.length; i++) {
    //   widget.record.ownerRef.add(widget.ownerRefList.toString());
    // }
    // for (int i = 0; i <= widget.record.ownerRef.length; i++) {
    //   widget.record.ownerRef.add(docuRef.documentID[i].toString());
    // }

    temp.add(docuRef.documentID.toString());

    await Firestore.instance
        .collection('maintain')
        .document(widget.fireBaseUser.email.toString())
        .updateData({
      'ownerRef': temp,
    });

    //   widget.record.ownerRef.add(docuRef.documentID.toString());
  }

  void pusharray(docuRef) {
    setState(() {
      // temp.add();
      print('--------- Length ________2  ' + docuRef.documentID.toString());
    });
  }
}
