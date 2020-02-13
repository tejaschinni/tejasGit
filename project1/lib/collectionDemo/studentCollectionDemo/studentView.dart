import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project1/collectionDemo/studentCollectionDemo/addStudentEdu.dart';
import 'package:project1/collectionDemo/studentCollectionDemo/studentDate.dart';
import 'package:project1/collectionDemo/studentCollectionDemo/studentedit.dart';

class StudentView extends StatefulWidget {
  DocumentSnapshot data;
  StudentView({this.data});
  @override
  _StudentViewState createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  TextEditingController snameController = TextEditingController();
  TextEditingController rolController = TextEditingController();
  TextEditingController m1Controller = TextEditingController();
  TextEditingController m2Controller = TextEditingController();
  TextEditingController m3Controller = TextEditingController();
  TextEditingController rollController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  TextEditingController perController = TextEditingController();

  String sname;
  int m1, m2, m3, roll, total;

  StudentData student;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    student = StudentData.fromSnapshot(widget.data);
    snameController.text = student.sname;
    rolController.text = student.roll.toString();
    m1Controller.text = student.m1.toString();
    m2Controller.text = student.m2.toString();
    m3Controller.text = student.m3.toString();
    totalController.text = student.total.toString();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Student'),
        actions: <Widget>[
          InkWell(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Icon(Icons.delete),
            ),
            onTap: () {
              setState(() {
                delete();
                Navigator.pop(context);
              });
            },
          ),
          InkWell(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Icon(Icons.add_box),
            ),
            onTap: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddStudentEdu(data: widget.data,)));
              });
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => StudentEdit(
                        data: widget.data,
                      )));
        });
      },
      child: Icon(Icons.edit),),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                child: TextField(
                  textAlign: TextAlign.center,
                  enabled: false,
                  controller: rolController,
                  onChanged: (String s) {
                    setState(() {
                      roll = int.parse(s);
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Roll no.',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: TextField(
                  textAlign: TextAlign.center,
                  enabled: false,
                  controller: snameController,
                  onChanged: (String s) {
                    setState(() {
                      sname = s;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Student Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: TextField(
                  textAlign: TextAlign.center,
                  enabled: false,
                  controller: m1Controller,
                  onChanged: (String s) {
                    setState(() {
                      m1 = int.parse(s);
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Marks 1',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: TextField(
                  textAlign: TextAlign.center,
                  enabled: false,
                  controller: m2Controller,
                  onChanged: (String s) {
                    setState(() {
                      m2 = int.parse(s);
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Marks 2',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: TextField(
                  textAlign: TextAlign.center,
                  enabled: false,
                  controller: m3Controller,
                  onChanged: (String s) {
                    setState(() {
                      m3 = int.parse(s);
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Marks 3',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              // Container(
              //   child: Text(student.total.toString()),
              // ),
              Container(
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: totalController,
                  enabled: false,
                  onChanged: (String s) {
                    setState(() {
                      total = int.parse(s);
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Total',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              // Container(
              //   child: Text(student.per.toString()),
              // ),
              Container(
                child: TextField(
                  textAlign: TextAlign.center,
                  enabled: false,
                  controller: perController,
                  onChanged: (String s) {
                    setState(() {
                     
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'per',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  // void edit() {
  //   Firestore.instance
  //       .collection('StudentCollection1')
  //       .document(widget.data.documentID)
  //       .setData({
  //     'sname': sname,
  //     'm1': m1,
  //     'm2': m2,
  //     'm3': m3,
  //     'total': total,
  //     'per': per,
  //     'roll': roll
  //   });
  // }

  void delete() async {
    Firestore.instance
        .collection('StudentCollection1')
        .document(widget.data.documentID)
        .delete()
        .catchError((onError) {
      print(onError);
    });
  }
}
