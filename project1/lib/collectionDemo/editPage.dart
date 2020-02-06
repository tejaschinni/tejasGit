import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project1/collectionDemo/record.dart';

class EditPage extends StatefulWidget {
  DocumentSnapshot data;
  EditPage({this.data});

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController voteController = TextEditingController();

  String name;
  int votes;
  Record record;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    record = Record.fromSnapshot(widget.data);
    nameController.text = record.name;
    voteController.text = record.votes.toString();
    print(record.name);
    print(record.votes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Page"),
        actions: <Widget>[
          InkWell(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Icon(Icons.delete),
            ),
            onTap: (){
              setState(() {
                delete();
                Navigator.pop(context);
              });
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          edit();
          print("Hello World");
        });
      }),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                controller: nameController,
                onChanged: (String s) {
                  setState(() {
                    name = s.toString();
                  });
                },
                decoration: InputDecoration(
                    hintText: 'Enter Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: TextField(
                  controller: voteController,
                  onChanged: (String s) {
                    setState(() {
                      votes = int.parse(s);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Enter votes', border: OutlineInputBorder()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void edit() {
    Firestore.instance
        .collection('collectionName')
        .document(widget.data.documentID)
        .setData({'name': name, 'votes': votes});
  }

  void delete() async{
    Firestore.instance
        .collection('collectionName')
        .document(widget.data.documentID)
        .delete()
        .catchError((onError) {
      print(onError);
    });
  }
}
