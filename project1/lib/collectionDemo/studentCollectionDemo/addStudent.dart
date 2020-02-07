import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddStudent extends StatefulWidget {
  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  TextEditingController snameController = TextEditingController();
  TextEditingController rolController = TextEditingController();
  TextEditingController m1Controller = TextEditingController();
  TextEditingController m2Controller = TextEditingController();
  TextEditingController m3Controller = TextEditingController(); 

  String sname;
  int m1,m2,m3,roll,total;
  double per;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Student"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                child: TextField(
                  controller: rolController,
                  onChanged: (String s){
                    setState(() {
                      roll = int.parse(s);
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Roll no.',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: TextField(
                  controller: snameController,
                  onChanged: (String s){
                    setState(() {
                      sname = s;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Student Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: TextField(
                  controller: m1Controller,
                  onChanged: (String s){
                    setState(() {
                      m1 = int.parse(s);
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Marks 1',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: TextField(
                  controller: m2Controller,
                  onChanged: (String s){
                    setState(() {
                      m2 = int.parse(s);
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Marks 2',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: TextField(
                  controller: m3Controller,
                  onChanged: (String s){
                    setState(() {
                      m3 = int.parse(s);
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Marks 3',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: RaisedButton(
                  onPressed: (){
                    total = (m1+m2+m3);
                    per = total/3;
                    print(sname);
                    print(roll);
                    insert();
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.save),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
  void insert(){
    Firestore.instance.collection('StudentCollection1').document().setData({'sname': sname,'m1':m1,'m2':m2,'m3':m3,'total':total,'per':per,'roll':roll});
  }
}
