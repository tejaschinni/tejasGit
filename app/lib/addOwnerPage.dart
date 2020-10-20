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
  TextEditingController familyMemberController = TextEditingController();
  TextEditingController maintaincesAmountController = TextEditingController();
  String name, roomno, amount, members, maintaincesAmount;

  List temp = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    name = nameController.text;
    members = familyMemberController.text;
    roomno = roomnoController.text;
    maintaincesAmount = maintaincesAmountController.text;

    // if (widget.ownerRefList != null) {
    //   temp.addAll(widget.ownerRefList);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Owner'),
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
            Container(
              child: TextField(
                controller: familyMemberController,
                onChanged: (String s) {
                  setState(() {
                    members = s;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Family members'),
              ),
            ),
            Container(
              child: TextField(
                controller: maintaincesAmountController,
                onChanged: (String s) {
                  setState(() {
                    maintaincesAmount = s;
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Monthly Maintaince Amount'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            pushData();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => OwnerListPage(
                          fireBaseUser: widget.fireBaseUser,
                          handleSignOut: widget.handleSignOut,
                          record: widget.record,
                        )));
            // Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => AdminDashBoardPage(
            //               fireBaseUser: widget.fireBaseUser,
            //               handleSignOut: widget.handleSignOut,
            //             )));

            nameController.text = '';
            roomnoController.text = '';
            familyMemberController.text = '';
          }),
    );
  }

  updateRecord() {
    //going to update records for localhost
  }

  void pushData() async {
    final docuRef = await Firestore.instance
        .collection('maintain')
        .document(widget.fireBaseUser.email.toString())
        .collection('owner')
        .add({
      'name': name,
      'roomno': roomno,
      'familyMemberController': members,
      'maintaincesAmount': maintaincesAmount,
    });

    // for (int i = 0; i <= widget.record.ownerRef.length; i++) {
    //   widget.record.ownerRef.add(widget.ownerRefList.toString());
    // }
    // for (int i = 0; i <= widget.record.ownerRef.length; i++) {
    //   widget.record.ownerRef.add(docuRef.documentID[i].toString());
    // }

    await Firestore.instance
        .collection('maintain')
        .document(widget.fireBaseUser.email.toString())
        .updateData({
      'ownerRef': FieldValue.arrayUnion([docuRef.documentID.toString()]),
    });

    //   widget.record.ownerRef.add(docuRef.documentID.toString());
  }

  void pusharray(docuRef) {
    setState(() {
      temp.add(docuRef.documentID.toString());
      print('--------- Length ________2  ' + docuRef.documentID.toString());
    });
  }
}
