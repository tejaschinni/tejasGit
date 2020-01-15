import 'package:flutter/material.dart';

class Cal extends StatefulWidget {
  @override
  _CalState createState() => _CalState();
}

class _CalState extends State<Cal> {
  String v = '0', c = '=';

  double a, b, d, ans;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Container(
                margin: EdgeInsets.all(5),
                child: Text("Calculator"),
              )),
              Expanded(
                  child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(right: 20, bottom: 20),
                child: Text(
                  c.toString(),
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              )),
              Expanded(
                  child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(20),
                child: Text(
                  v.toString(),
                  style: TextStyle(fontSize: 30),
                ),
              )),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("%"),
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          v = '0';
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("CE"),
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          v = '0';
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("C"),
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          if (v.length > 0) {
                            v = v.substring(0, (v.length - 1));
                          }
                        });
                      },
                      child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(5),
                          child: Icon(Icons.cancel)),
                    )),
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
                          v = v + '1';
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("1"),
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          v = v + '2';
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("2"),
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          v = v + '3';
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("3"),
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          c = '+';
                          a = double.parse(v);
                          v = '';
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("+"),
                      ),
                    )),
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
                          v = v + '4';
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("4"),
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          v = v + '5';
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("5"),
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          v = v + '6';
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("6"),
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          c = '-';
                          a = double.parse(v);
                          v = '';
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("-"),
                      ),
                    )),
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
                          v = v + '7';
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("7"),
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          v = v + '8';
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("8"),
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          v = v + '9';
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("9"),
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          c = '*';
                          a = double.parse(v);
                          v = '';
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("*"),
                      ),
                    )),
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
                          v = v + '0';
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("0"),
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          v = v + '.';
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("."),
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          c = '/';
                          a = double.parse(v);
                          v = '';
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("/"),
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {                          
                          b = double.parse(v);                          
                          v = getAns().toString();
                          print(getAns().toString());
                          c = '=';
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("="),
                      ),
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  getAns() {           
         
    if (c == '+') {
      return a + b;
    } else if (c == '-'){
      return a - b;
    }
    if (c == '*') {
      return a * b;
    }
    if (c == '/') {
      return a / b;
    }
  }
}