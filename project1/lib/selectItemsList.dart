import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project1/constant.dart';
import 'package:project1/itemFirebaseData.dart';

class SelectItemPage extends StatefulWidget {
  // final Function handleSignOut;
  // final GoogleSignInAccount _currentUser;
  // SelectItemPage(this.handleSignOut, this._currentUser);
  @override
  _SelectItemPageState createState() => _SelectItemPageState();
}

class _SelectItemPageState extends State<SelectItemPage> {
  bool boxvalue = false;

  String userEmail;

  FirebaseUser user;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List itemEngName;

  List items = new List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cFireBaseAuth.currentUser().then((user) => setState(() {
          this.user = user;
          userEmail = user.email;
        }));
    // print(userEmail);
    loadItems();
    //fectchItemsData();
  }

  loadItems() {
    Firestore.instance
        .collection('itemList')
        .document()
        .get()
        .then((DocumentSnapshot dc) {
      print('Length of ItemS ' + items.length.toString());
    });
  }

  fectchItemsData() async {
    final QuerySnapshot result = await Firestore.instance
        .collection('StudentCollection1')
        .getDocuments();

    final List<DocumentSnapshot> document = result.documents;
    document.forEach((data) {
      final record = ItemsFirebase.fromSnapshot(data);
      items.add(record);
    });
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
            setState(() {});
          }),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('itemList').snapshots(),
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
    final listitems = ItemsFirebase.fromSnapshot(data);

    Map<String, bool> numbers = {
      'listitems.itemEnglishName': false,
      'listitems.itemMarathiName': false,
      'listitems.itemHindiName': false,
      'listitems.itemPrice': false,
      'listitems.itemsQuantity': false,
      'listitems.itemsUnite': false,
    };

    var holder_1 = [];

    getItems() {
      numbers.forEach((key, value) {
        if (value == true) {
          holder_1.add(key);
        }
      });

      // Printing all selected items on Terminal screen.
      print(holder_1);
      // Here you will get all your selected Checkbox items.

      // Clear array after use.
      holder_1.clear();
    }

    return Padding(
      // key: ValueKey(student.sname),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.0)),
        child: Center(
          child: Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.green[100], Colors.green]),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Text(listitems.itemEnglishName),
                )),
                Expanded(
                    child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Text(listitems.itemPrice + ' Rs'),
                )),
                Expanded(
                    child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: ListView(
                    children: numbers.keys.map((String key) {
                      return new CheckboxListTile(
                        value: numbers[key],
                        activeColor: Colors.pink,
                        checkColor: Colors.white,
                        onChanged: (bool value) {
                          setState(() {
                            numbers[key] = value;
                          });
                        },
                      );
                    }).toList(),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
