import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project1/collectionDemo/studentCollectionDemo/addStudent.dart';
import 'package:project1/collectionDemo/studentCollectionDemo/studentDate.dart';
import 'package:project1/collectionDemo/studentCollectionDemo/studentView.dart';
import 'package:project1/collectionDemo/studentCollectionDemo/studentedit.dart';
import 'package:project1/itemFirebaseData.dart';

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student List"),
        actions: <Widget>[
          InkWell(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Icon(Icons.add),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddStudent()));
            },
          )
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('itemList')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final student = ItemsFirebase.fromSnapshot(data);

    return Padding(
      // key: ValueKey(student.sname),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.0)),
        child: ListTile(
          leading: Text(student.itemEnglishName),
          title: Text(student.itemsQuantity.toString()),
          
          trailing: GestureDetector(
            onTap: () {
              print(data.documentID);
               Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentView(data: data,)));
            },
            child: Icon(Icons.view_agenda),
          ),
          onTap: () => Firestore.instance.runTransaction((transaction) async {
            final freshSnapshot = await transaction.get(student.reference);
            final fresh = ItemsFirebase.fromSnapshot(freshSnapshot);
            // await transaction.update(student.reference, {'votes':fresh.votes +1});
          }),
        ),
      ),
    );
  }
}
