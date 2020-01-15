import 'package:flutter/material.dart';


class Design extends StatefulWidget {
  @override
  _DesignState createState() => _DesignState();
}

class _DesignState extends State<Design> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 20,
          backgroundColor: Colors.blue[300],
          title: Text("Demo App",style: TextStyle(fontSize: 18),),
          actions: <Widget>[
            Container(margin: EdgeInsets.all(20), child: Icon(Icons.ac_unit,color: Colors.pink,size: 20,))
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                color: Colors.blue[300],
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Dashboard"),
                trailing: Icon(Icons.refresh),
              ),
              
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Dashboard"),
                trailing: Icon(Icons.refresh),
              ),
              
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Dashboard"),
                trailing: Icon(Icons.refresh),
              )
            ],
          ),
        ),
      ),
    );
  }
}