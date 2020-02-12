import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project1/authPage.dart';
import 'package:project1/constant.dart';
import 'package:project1/customer.dart';

class Demo extends StatefulWidget {
  final Function handleSignOut;
  final GoogleSignInAccount _currentUser;
  Demo(this.handleSignOut,this._currentUser);
  // final CustomerDataType customerdatatype;
  // Demo({this.customerdatatype});
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  TextEditingController fameContorller = TextEditingController();
  TextEditingController lameContorller = TextEditingController();
  TextEditingController addressContorller = TextEditingController();
  TextEditingController mobileContorller = TextEditingController();
  // Profile profile;
  String photoUrl =
      'https://www.pinclipart.com/picdir/big/142-1421318_abdu-sentamu-person-image-placeholder-clipart.png';
  FirebaseUser user;
  bool agreed = false, nameEdit = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Customer Detials"),
        backgroundColor: Colors.green,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            width: 35.0,
            height: 70.0,
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
            ),
            child: Container(
              child: PopupMenuButton<String>(
                padding: EdgeInsets.zero,
                icon: CircleAvatar(
                  backgroundImage: NetworkImage(photoUrl),
                ),
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'Profile',
                    child: ListTile(
                      leading: Icon(Icons.visibility),
                      title: Text('Proflie'),
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'SignOut',
                    child: ListTile(
                      leading: Icon(Icons.person_add),
                      title: Text('SignOut'),
                    ),
                  ),
                ],
                onSelected: (String s) {
                  print(s);
                  if (s == 'SignOut') {
                    widget.handleSignOut();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AuthPage()));
                  }
                  if (s == 'Profile') {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>StoreBoxPage()));
                  }
                },
              ),
            ),
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Customer').snapshots(),
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
    final customer = Customer.fromSnapshot(data);

    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          // padding: EdgeInsets.only(top: 300),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0)),
                child: ListTile(
                  title: Text(customer.fname),
                  trailing: GestureDetector(
                    onTap: () {
                      print(data.documentID);
                      //  Navigator.push(context, MaterialPageRoute(builder: (context)=>profileView(data: data,)));
                    },
                    child: Icon(Icons.view_agenda),
                  ),
                  onTap: () =>
                      Firestore.instance.runTransaction((transaction) async {
                    final freshSnapshot =
                        await transaction.get(customer.reference);
                    final fresh = Customer.fromSnapshot(freshSnapshot);
                    // await transaction.update(profile.reference, {'votes':fresh.votes +1});
                  }),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}


