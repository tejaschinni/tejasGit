import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project1/collectionDemo/record.dart';
import 'package:project1/collectionDemo/studentCollectionDemo/studentDate.dart';

class AddStudentEdu extends StatefulWidget {
  DocumentSnapshot data;
  AddStudentEdu({this.data});
  @override
  _AddStudentEduState createState() => _AddStudentEduState();
}

class _AddStudentEduState extends State<AddStudentEdu> {
  TextEditingController eduController = TextEditingController();
  StudentData sc;
  List education = new List();

  loadStudent() {
    Firestore.instance
        .collection('StudentCollection1')
        .document()
        .get()
        .then((DocumentSnapshot doc) {
      print("----------------------" + education.length.toString());
    });
  }

  fectchStudentdData() async {
    final QuerySnapshot result = await Firestore.instance
        .collection('StudentCollection1')
        .getDocuments();

    final List<DocumentSnapshot> document = result.documents;
    document.forEach((data) {
      final record = StudentData.fromSnapshot(data);
      education.add(record);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    
      fectchStudentdData();
      loadStudent();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Student Eduction"),
      ),
      body: Center(
        child: Container(
          child: Text(sc.sname.toString()),

        ),
      ),
    );
  }
}
