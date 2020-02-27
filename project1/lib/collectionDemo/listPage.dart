import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project1/collectionDemo/addDataForCollection.dart';
import 'package:project1/collectionDemo/editPage.dart';
import 'package:project1/collectionDemo/record.dart';


class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  
  final FixedExtentScrollController _controller = FixedExtentScrollController();
  List<Widget> recordname = new List();
  @override
  
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddDataForCollection()));
            },
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              child: Icon(Icons.add),
            ),
          )
        ],
      ), 
      body: _buildBody(context),     
    );
  }
  Widget _buildBody(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('collectionName').orderBy('votes',descending: true).snapshots(),
      builder: (context,snapshot){
        if(!snapshot.hasData)return LinearProgressIndicator();

        return 
        _buildList(context ,snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot>snapshot){
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data)=>_buildListItem(context,data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data){
    final record = Record.fromSnapshot(data);

    return SizedBox(
          child: Padding(
        key: ValueKey(record.name),
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
        child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0)
              ),
              child: ListTile(
                title: Text(record.name),
                leading: Text(record.votes.toString()),
                trailing: GestureDetector(
                  onTap: (){
                    print(data.documentID);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EditPage(data: data,)));
                  },  
                  child: Icon(Icons.edit),
                ),
                onTap: ()=> Firestore.instance.runTransaction((transaction) async{
                  final freshSnapshot = await transaction.get(record.reference);
                  final fresh = Record.fromSnapshot(freshSnapshot);
                  // await transaction.update(record.reference, {'votes':fresh.votes +1});
                }),
              ),
            ),
      ),
    );
  }
}