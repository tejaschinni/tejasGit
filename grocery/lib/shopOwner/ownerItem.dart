import 'package:flutter/material.dart';
import 'package:grocery/menuIcon.dart';

class OwnerItem extends StatefulWidget {
  @override
  _OwnerItemState createState() => _OwnerItemState();
}

class _OwnerItemState extends State<OwnerItem> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String photoUrl = 'https://www.pinclipart.com/picdir/big/142-1421318_abdu-sentamu-person-image-placeholder-clipart.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  // widget.handleSignOut();
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => AuthPage()));
                }
                if(s == 'Profile'){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>()));
                }
              },
            ),
          ),
              ),
              
        ],
        leading: IconButton(
          icon: MenuIconsPage(),
          onPressed: () => _scaffoldkey.currentState.openDrawer(),
        ),
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
                        ),
                        ListTile(
                          leading: Icon(Icons.person, color: Colors.white),
                          title: Text(
                            'Profile',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.search, color: Colors.white),
                          title: Text(
                            'Search',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.history, color: Colors.white),
                          title: Text(
                            'History',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.payment, color: Colors.white),
                          title: Text(
                            'Payment',
                            style: TextStyle(color: Colors.white),
                          ),
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
                          //onTap: () => Navigator.push(context, MaterialPageRoute(builder:  (context)=>DemoPage(widget.handleSignOut,widget._currentUser))),
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
    );
  }
}