import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery/auth.dart';
import 'package:grocery/contant.dart';
import 'package:grocery/data/owner.dart';
import 'package:grocery/demo/demo1.dart';
import 'package:grocery/menuIcon.dart';
import 'package:grocery/shopOwner/ownerItem.dart';
import 'package:grocery/shopOwner/ownerProfile.dart';


class OwnerDashBoard extends StatefulWidget {
 
  final Function _handleSignOut;
  OwnerDashBoard(this._handleSignOut);
  @override
  _OwnerDashBoardState createState() => _OwnerDashBoardState();
}

class _OwnerDashBoardState extends State<OwnerDashBoard> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  FirebaseUser user;
  
String photoUrl ;

@override
  void initState() {
    // TODO: implement initState
    
     setState(() {
       cFireBaseAuth.currentUser().then((user) => setState(() {
          this.user = user;
          if(photoUrl != null){
            photoUrl = user.photoUrl;
          }
          else{
            photoUrl = 'https://www.pinclipart.com/picdir/big/142-1421318_abdu-sentamu-person-image-placeholder-clipart.png';
          }
        }));
     });
  }

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
                   widget._handleSignOut();
                   print('-------Emaill'+ user.email.toString());
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AuthPage()));
                }
                if(s == 'Profile'){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Demo1(widget._handleSignOut)));
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
      body:Column(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: (){
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OwnerItem()));
                });
              },
              child: Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.hardLight),
                        image: AssetImage(
                          'assets/grocerylist.jpg',
                        ),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 100,
                      top: 100,
                      child: Text(
                        'LIST OF ITEMS',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                // setState(() {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => CustomerListPage(widget.handleSignOut,widget._currentUser)));
                // });
              },
              child: Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.hardLight),
                        image: AssetImage(
                          'assets/customer.jpg',
                        ),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 100,
                      top: 100,
                      child: Text(
                        'CUSTOMER LIST',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                // setState(() {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => OrderPage(widget.handleSignOut,widget._currentUser)));
                // });
              },
              child: Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.hardLight),
                        image: AssetImage(
                          'assets/order.jpg',
                        ),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 150,
                      top: 100,
                      child: Text(
                        'ORDERS',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

 
}