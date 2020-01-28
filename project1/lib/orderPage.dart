import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project1/dashBoardPage.dart';
import 'package:project1/demo/menuIcons.dart';
import 'package:project1/orderDataType.dart';

class OrderPage extends StatefulWidget {
  // final Function handleSignOut;
  // final GoogleSignInAccount _currentUser;
  // OrderPage(this.handleSignOut,this._currentUser);
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  List<OrderDataType> orderList = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    orderList.add(OrderDataType(
        id: 1,
        name: 'Tejas Chinni',
        price: 50
    ));
    orderList.add(OrderDataType(
        id: 1,
        name: 'Tejas Chinni',
        price: 50
    ));
    orderList.add(OrderDataType(
        id: 1,
        name: 'Tejas Chinni',
        price: 50
    ));
    orderList.add(OrderDataType(
        id: 1,
        name: 'Tejas Chinni',
        price: 50
    ));
    orderList.add(OrderDataType(
        id: 1,
        name: 'Tejas Chinni',
        price: 50
    ));
    orderList.add(OrderDataType(
        id: 1,
        name: 'Tejas Chinni',
        price: 50
    ));
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Order'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Icon(Icons.search,size: 30,),
          )
        ],
        leading: IconButton(
          icon: MenuIconsPage(),
          onPressed: ()=> _scaffoldkey.currentState.openDrawer(),
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
                          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoardPage())),
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
      body: Center(
        child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: ListView.builder(
              itemCount: orderList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/wallpaper.jpg'),
                    ),
                    title: Text(orderList[index].name),
                    subtitle: Text(orderList[index].price.toString()),
                    trailing: Container(
                      height: 25,
                      width: 69,
                      child: Center(child: Icon(Icons.arrow_forward_ios)),
                    ),
                    onTap: () {},
                  ),
                );
              },
            ),
            ),
      ),
    );
  }
}