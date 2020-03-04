import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project1/constant.dart';
import 'package:project1/data/itemFirebaseData.dart';

class SelectItemPage extends StatefulWidget {
  final Function handleSignOut;
  final GoogleSignInAccount _currentUser;
  SelectItemPage(this.handleSignOut, this._currentUser);
  @override
  _SelectItemPageState createState() => _SelectItemPageState();
}

class _SelectItemPageState extends State<SelectItemPage> {
  bool boxvalue;

  String userEmail;

  FirebaseUser user;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;


  List items = new List();

  List ownerItems = List();
  List temp = List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cFireBaseAuth.currentUser().then((user) => setState(() {
          this.user = user;
          userEmail = user.email;
        }));
    // print(userEmail);
    setState(() {
      loadItems();
      fectchItemsData();
    });
    //checkItems();
  }

  loadItems() {
    Firestore.instance
        .collection('itemList')
        .document()
        .get()
        .then((DocumentSnapshot dc) {
      //  items.add();
    });
  }

  fectchItemsData() async {
    final QuerySnapshot result =
        await Firestore.instance.collection('itemList').getDocuments();

    final List<DocumentSnapshot> document = result.documents;
    document.forEach((data) {
      final record = ItemsFirebase.fromSnapshot(data);
      items.add(record);
    });
  }

  void checkItems(){
   
  }

  void pusitems()async {
    for (var i = 0; i < items.length; i++) {
     
       final docRef = await Firestore.instance.collection('ownerItem').add({
      'itemsEngName': items[i].itemEnglishName,
      'itemsHindiName': items[i].itemHindiName,
      'itemsMarathiName': items[i].itemMarathiName,
    });

    temp.add(docRef.documentID);
    
   print('Temp Data' + temp[i]);
   Firestore.instance.collection('ShopOwner').document(userEmail).updateData({
     'items':temp,
   });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Items '),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            setState(() {
              pusitems();
            });
          }),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, int i) {
            return ListTile(
                title: Text(items[i].itemEnglishName),
                trailing: Checkbox(
                  value: items[i].status,
                  onChanged: (bool s) {
                    setState(() {
                      items[i].status = s;
                      boxvalue = s;
                    });
                  },
                ));
          }),
    );
  }
}
