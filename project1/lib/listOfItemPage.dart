import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project1/addItemPage.dart';
import 'package:project1/dashBoardPage.dart';
import 'package:project1/demo/menuIcons.dart';
import 'package:http/http.dart' as http;
import 'package:project1/editItemPage.dart';
import 'package:project1/itemFirebaseData.dart';
import 'package:project1/litemDataType.dart';

class ListOfItemPage extends StatefulWidget {
  final Function handleSignOut;
  final GoogleSignInAccount _currentUser;
  ListOfItemPage(this.handleSignOut, this._currentUser);
  @override
  _ListOfItemPageState createState() => _ListOfItemPageState();
}

class _ListOfItemPageState extends State<ListOfItemPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  //List<Items> itemList = List();

  String itemEnglishName, itemQanity, itemPrice, itemUnit;

  List<ItemsFirebase> itemFireData = new List();

  List<Items> parseItems(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Items>((json) => Items.fromJson(json)).toList();
  }

  Future<List<Items>> fetchItems(http.Client client) async {
    final response = await client.get(
        'https://raw.githubusercontent.com/chetan2469/git/master/grocery_market/grocery.json');

    return parseItems(response.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('List Of Items'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Icon(
              Icons.search,
              size: 30,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                setState(() {});
              },
              child: Icon(
                Icons.insert_drive_file,
                size: 30,
              ),
            ),
          )
        ],
        leading: IconButton(
          icon: MenuIconsPage(),
          onPressed: () => _scaffoldkey.currentState.openDrawer(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddItemPage()));
          });
        },
        child: Icon(Icons.add),
      ),
      drawer: SafeArea(
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent.withOpacity(0.3),
          ),
          child: Drawer(
            child: Container(
              //color: Colors.black.withOpacity(0.1),
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 150,
                    alignment: Alignment.center,
                    color: Colors.black,
                    child: ListTile(
                      title: Text(
                        'Balaji Tenders',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      subtitle: Text(
                        'Address' + '\nNumber',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.home, color: Colors.white),
                          title: Text(
                            'Home',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashBoardPage(
                                      widget.handleSignOut,
                                      widget._currentUser))),
                        ),
                        ListTile(
                          leading: Icon(Icons.person, color: Colors.white),
                          title: Text(
                            'Profile',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashBoardPage(
                                      widget.handleSignOut,
                                      widget._currentUser))),
                        ),
                        ListTile(
                          leading: Icon(Icons.search, color: Colors.white),
                          title: Text(
                            'Search',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashBoardPage(
                                      widget.handleSignOut,
                                      widget._currentUser))),
                        ),
                        ListTile(
                          leading: Icon(Icons.history, color: Colors.white),
                          title: Text(
                            'History',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashBoardPage(
                                      widget.handleSignOut,
                                      widget._currentUser))),
                        ),
                        ListTile(
                          leading: Icon(Icons.payment, color: Colors.white),
                          title: Text(
                            'Payment',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashBoardPage(
                                      widget.handleSignOut,
                                      widget._currentUser))),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Setting',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashBoardPage(
                                      widget.handleSignOut,
                                      widget._currentUser))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Items>>(
        future: fetchItems(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ItemsList(item: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ItemsList extends StatelessWidget {
  final List<Items> item;

  ItemsList({Key key, this.item}) : super(key: key);

  void insert() {
    for (var i = 0; i < item.length; i++) {
      Firestore.instance.collection('itemList').document().setData({
        'itemEnglishName': item[i].itemEnglishName,
        'itemHindiName': item[i].itemHindiName,
        'itemMarathiName': item[i].itemMarathiName,
        'itemsUnite': item[i].itemUnite,
        'itemsQuantity': item[i].itemQuantity,
        'itemPrice': item[i].itemPrice,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
    //   ListView.builder(
    //       itemCount: item.length,
    //       itemBuilder: (contex, index) {
    //         return
    //             ListTile(
    //           title: Text(item[index].itemEnglishName),
    //           onTap: () {
    //             insert();
    //           },
    //         );
    //       });
    // }
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

    return Padding(
      // key: ValueKey(student.sname),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.0)),
        child: InkWell(
          onTap: (){
            
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => EditItemPage(
            //               data: data,
            //             )));
          },
          child: ListTile(
            leading: Text(listitems.itemEnglishName),
            title: Text(listitems.itemMarathiName.toString() +
                '/' +
                listitems.itemHindiName),
            subtitle: Text(listitems.itemsQuantity.toString() +
                '\t' +
                listitems.itemsUnite),
                trailing: Text(listitems.itemPrice +' '+'Rs'),

            // trailing: GestureDetector(
            //   onTap: () {
            //     print(data.documentID);
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => EditItemPage(
            //                   data: data,
            //                 )));
            //   },
            //   child: Icon(Icons.view_agenda),
            // ),
            onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>EditItemPage(data: data,)))
              // await transaction.update(student.reference, {'votes':fresh.votes +1});
           // }),
          ),
        ),
      ),
    );
  }
}
//  Firestore.instance.runTransaction((transaction) async {
//               final freshSnapshot = await transaction.get(listitems.reference);
//               final fresh = ItemsFirebase.fromSnapshot(freshSnapshot);