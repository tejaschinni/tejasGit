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
  TextEditingController eduController = TextEditingController();

  String sname;
  int m1, m2, m3, roll, total;

  List edu = new List();

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

    setState(() {});

    fectchStudentdData();
    loadStudent();
  }

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
                daigl();
              });
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StudentEdit(
                          data: widget.data,
                        )));
          });
        },
        child: Icon(Icons.edit),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: student.edu.length,
              itemBuilder: (context, index) {
                return Chip(
                  onDeleted: (){
                      delEdu(student.edu[index]);
                  },
                  deleteIconColor: Colors.white,
                  label: Text(
                    student.edu[index],
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  backgroundColor: Colors.red,
                );
              }),
        ),
      ),
    );
  }

  // void edit() {
  //   List temp = List();

  //   setState(() {
  //     temp = student.edu;
  //   });
  //   print('==========$temp');
  //   print(temp.length);

  //   setState(() {
  //     temp.add(student.edu);
  //   });

  //   Firestore.instance
  //       .collection('StudentCollection1')
  //       .document(student.reference.documentID)
  //       .updateData({
  //     'edu': temp,
  //   });

  //   print( student.edu);
  // }

  void addEdu(String edu) {
    List temp = new List();

    setState(() {
      temp.add(edu);
    });

    Firestore.instance
        .collection('StudentCollection1')
        .document(student.reference.documentID)
        .updateData({'edu': FieldValue.arrayUnion(temp)});
  }

   void delEdu(String edu) {
    List temp = new List();

    setState(() {
      temp.add(edu);
    });

    Firestore.instance
        .collection('StudentCollection1')
        .document(student.reference.documentID)
        .updateData({'edu': FieldValue.arrayRemove(temp)});

  }

  void delete() async {
    Firestore.instance
        .collection('StudentCollection1')
        .document(widget.data.documentID)
        .delete()
        .catchError((onError) {
      print(onError);
    });
  }

  void daigl() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add Education'),
            content: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: eduController,
                      decoration: InputDecoration(
                          labelText: 'Eduction',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Center(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            child: Text("Submit"),
                            onPressed: () {
                              setState(() {
                                addEdu(eduController.text);
                                Navigator.pop(context);
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            child: Text("Cancel"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
