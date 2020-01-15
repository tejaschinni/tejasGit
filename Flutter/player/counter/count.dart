import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 
  int count =0;
  Color bg = Colors.blue;
  

  setdata(int count) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', count);
  }

  getdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
     count = prefs.getInt('counter');
     if(count==null)
     {
       count = 0;
     }
     print(count);
    });
  }

  addColorToSF(String color) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('bgcolor', color);
  }

  getColorValue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String color = pref.getString('bgcolor');
    setState(() {
     if(color == "red"){
       bg = Colors.red;
     } else if(color == 'green'){
       bg = Colors.green;
     }
     if(color == 'blue'){
       bg = Colors.blue;
     }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    count=0;
    getdata();
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:  bg,
        body: SafeArea(
          child: Row(
            children: <Widget>[
              Center(
            child: Text(count.toString()),
          ),
          Expanded(
            child: RaisedButton(
              child: Text("red"),
              onPressed: (){
                 setState(() {
                 bg = Colors.red; 
                });
                addColorToSF("red");
              },
            ),
          ),
          Expanded(
            child: RaisedButton(
              child: Text("green"),
              onPressed: (){
                setState(() {
                 bg = Colors.green; 
                });
                addColorToSF("green");
              },
            ),
          ),
          Expanded(
            child: RaisedButton(
              child: Text("blue"),
              onPressed: (){
                setState(() {
                 bg = Colors.blue; 
                });
                addColorToSF("blue");
              },
            ),
          ),

            ],
          )
          
        ),
        
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            setState(() {
              ++count;
            });
            setdata(count);
            print(count.toString());
          },
        ),
        
      ),
    );
  }
}
