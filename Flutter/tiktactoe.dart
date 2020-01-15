import 'package:flutter/material.dart';

class Tik extends StatefulWidget {
  @override
  _TikState createState() => _TikState();
}

class _TikState extends State<Tik> {
  bool flag = true;
  bool b1 = true,
      b2 = true,
      b3 = true,
      b4 = true,
      b5 = true,
      b6 = true,
      b7 = true,
      b8 = true,
      b9 = true;

  String one = ' ',
      two = ' ',
      three = ' ',
      four = ' ',
      five = ' ',
      six = ' ',
      seven = ' ',
      eight = ' ',
      nine = ' ',
      player1 =' ',
      player2 =' ';
      

  void reset() {
    setState(() {
      one = ' ';
      two = ' ';
      three = ' ';
      four = ' ';
      five = ' ';
      six = ' ';
      seven = ' ';
      eight = ' ';
      nine = ' ';
      b1 = true;
      b2 = true;
      b3 = true;
      b4 = true;
      b5 = true;
      b6 = true;
      b7 = true;
      b8 = true;
      b9 = true;
    });
  }

  void check() {
    if ((one == two && two == three && one != ' ') ||
        (four == five && five == six && four != ' ') ||
        (seven == eight && eight == nine && seven != ' ') ||
        (one == four && four == seven && one != ' ') ||
        (two == five && five == eight && two != ' ') ||
        (three == six && six == nine && three != ' ') ||
        (one == five && five == nine && one != ' ') ||
        (three == five && five == seven && three != ' ')) {
      print(" winner ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 25),
                  child: Text("Tic Tac Toe",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 30),),
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                child: RaisedButton(
                  onPressed: (){
                    reset();
                  },
                  child: Text("Reset",style: TextStyle(fontSize: 20,color: Colors.white),),
                  color: Colors.black,
                ),
              ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {                           
                            if(b1)
                            {
                              if (flag) {
                              one = "x";
                            } else {
                              one = "0";
                            }
                            flag = !flag;
                            b1 = false;
                            }                        
                          });
                          check();                          
                        },
                        child: Container(
                          margin: EdgeInsets.all(3),
                          color: Colors.blueAccent,
                          child: Center(
                            child: Text(one),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {                           
                            if(b2)
                            {
                              if (flag) {
                              two = "x";
                            } else {
                              two = "0";
                            }
                            flag = !flag;
                            b2 = false;
                            }                        
                          });
                          check();                           
                        },
                        child: Container(
                          margin: EdgeInsets.all(3),
                          color: Colors.blueAccent,
                          child: Center(
                            child: Text(two),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {                           
                            if(b3)
                            {
                              if (flag) {
                              three = "x";
                            } else {
                              three = "0";
                            }
                            flag = !flag;
                            b3 = false;
                            }                        
                          });
                          check();                           
                        },
                        child: Container(
                          margin: EdgeInsets.all(3),
                          color: Colors.blueAccent,
                          child: Center(
                            child: Text(three),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {                           
                            if(b4)
                            {
                              if (flag) {
                              four = "x";
                            } else {
                              four = "0";
                            }
                            flag = !flag;
                            b4 = false;
                            }                        
                          });
                          check();                           
                        },
                        child: Container(
                          margin: EdgeInsets.all(3),
                          color: Colors.blueAccent,
                          child: Center(
                            child: Text(four),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {                           
                            if(b5)
                            {
                              if (flag) {
                              five = "x";
                            } else {
                              five = "0";
                            }
                            flag = !flag;
                            b5 = false;
                            }                        
                          });
                          check();                           
                        },
                        child: Container(
                          margin: EdgeInsets.all(3),
                          color: Colors.blueAccent,
                          child: Center(
                            child: Text(five),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {                           
                            if(b6)
                            {
                              if (flag) {
                              six = "x";
                            } else {
                              six = "0";
                            }
                            flag = !flag;
                            b6 = false;
                            }                        
                          });
                          check();                           
                        },
                        child: Container(
                          margin: EdgeInsets.all(3),
                          color: Colors.blueAccent,
                          child: Center(
                            child: Text(six),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                       onTap: () {
                          setState(() {                           
                            if(b7)
                            {
                              if (flag) {
                              seven = "x";
                            } else {
                              seven = "0";
                            }
                            flag = !flag;
                            b7 = false;
                            }                        
                          });
                          check();
                           
                        },
                        child: Container(
                          margin: EdgeInsets.all(3),
                          color: Colors.blueAccent,
                          child: Center(
                            child: Text(seven),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {                           
                            if(b8)
                            {
                              if (flag) {
                              eight = "x";
                            } else {
                              eight = "0";
                            }
                            flag = !flag;
                            b8 = false;
                            }                        
                          });
                          check();
                           
                        },
                        child: Container(
                          margin: EdgeInsets.all(3),
                          color: Colors.blueAccent,
                          child: Center(
                            child: Text(eight),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {                           
                            if(b9)
                            {
                              if (flag) {
                              nine = "x";
                            } else {
                              nine = "0";
                            }
                            flag = !flag;
                            b9 = false;
                            }                        
                          });
                          check();
                           
                        },
                        child: Container(
                          margin: EdgeInsets.all(3),
                          color: Colors.blueAccent,
                          child: Center(
                            child: Text(nine),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
