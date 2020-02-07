import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddDataForCollection extends StatefulWidget {
  @override
  _AddDataForCollectionState createState() => _AddDataForCollectionState();
}

class _AddDataForCollectionState extends State<AddDataForCollection> {
  TextEditingController nameController = TextEditingController();
  TextEditingController voteController = TextEditingController();

  String name;
  int votes;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collection Demo'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        print(name);
        print(votes);
        insert();
      },
      child: Icon(Icons.add),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                controller: nameController,
                onChanged: (String s){
                  setState(() {
                    name = s.toString();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: TextField(
                  controller: voteController,
                  onChanged: (String s){
                    setState(() {
                      votes = int.parse(s);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter votes',
                    border: OutlineInputBorder()
                  ),
                ),
              )
            ],
          ),
        ),
      ),   
    );
  }



  void insert(){
    Firestore.instance.collection('collectionName').document().setData({'name':name,'votes':votes});
  }
}