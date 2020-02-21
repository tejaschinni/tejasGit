import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project1/addItemsPage.dart';
import 'package:project1/dashBoardPage.dart';
import 'package:project1/demo/menuIcons.dart';
import 'package:project1/items.dart';

class ListOfItemPage extends StatefulWidget {
  final Function handleSignOut;
  final GoogleSignInAccount _currentUser;
  ListOfItemPage(this.handleSignOut, this._currentUser);
  @override
  _ListOfItemPageState createState() => _ListOfItemPageState();
}

class _ListOfItemPageState extends State<ListOfItemPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
 // List<ItemDataType> itemList = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
          )
        ],
        leading: IconButton(
          icon: MenuIconsPage(),
          onPressed: () => _scaffoldkey.currentState.openDrawer(),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddItemsPage()));
        });
      },child: Icon(Icons.add),),
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
      body: _buildBody(context),
      // body: Center(
      //   child: Container(
      //     child: ListView.builder(
      //       itemCount: itemList.length,
      //       itemBuilder: (context, index) {
      //         return Center(
      //           child: SizedBox(
      //             child: Container(
      //               decoration:
      //                   BoxDecoration(borderRadius: BorderRadius.circular(10)),
      //               child: ListView.builder(
      //                 scrollDirection: Axis.vertical,
      //                 shrinkWrap: true,
      //                 itemCount: itemList.length,
      //                 itemBuilder: (context, index) {
      //                   return Container(
      //                     margin: EdgeInsets.only(top: 5, left: 5, right: 5),
      //                     decoration: BoxDecoration(
      //                       color: Colors.grey.withOpacity(0.1),
      //                       borderRadius: BorderRadius.circular(10),
      //                       shape: BoxShape.rectangle,
      //                     ),
      //                     child: ListTile(
      //                       leading: CircleAvatar(
      //                         backgroundImage:
      //                             AssetImage('assets/wallpaper.jpg'),
      //                       ),
      //                       title: Text(itemList[index].name),
      //                       trailing: Container(
      //                         height: 25,
      //                         width: 69,
      //                         child:
      //                             Center(child: Text(itemList[index].price.toString())),
      //                       ),
      //                       onTap: () {},
      //                     ),
      //                   );
      //                 },
      //               ),
      //             ),
      //           ),
      //         );
      //       },
      //     ),
      //   ),
      // ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Items').snapshots(),
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
    final items = Items.fromSnapshot(data);

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
                  title: Text(items.itemname),
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
                        await transaction.get(items.reference);
                    final fresh = Items.fromSnapshot(freshSnapshot);
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
