import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FutureBuilerDemo extends StatefulWidget {
  @override
  _FutureBuilerDemoState createState() => _FutureBuilerDemoState();
}

class _FutureBuilerDemoState extends State<FutureBuilerDemo> {
  TextEditingController numbercontroller = TextEditingController();
  String c = "0";
  Random r = Random();
  int a = 1;
  String b;
  String d;
  String url = 'http://numbersapi.com/0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder(
            future: url != null
                ? http.get(url).then((response) => response.body)
                : null,
            builder: (BuildContext contex, AsyncSnapshot<String> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text("Input A url to start");
                case ConnectionState.waiting:
                  return new Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.active:
                  return new Text("Active");
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return new Text(
                      '${snapshot.error}',
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return Column(
                      children: <Widget>[
                        SizedBox(
                          height: 100,
                        ),
                        Text(snapshot.data),
                        Container(
                            child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 100,
                            ),
                            // TextField(
                            //   controller: numbercontroller,
                            //   decoration: InputDecoration(
                            //       border: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(10))),
                            // ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  
                                  RaisedButton(
                                    onPressed: () {
                                      setState(() {
                                        d = r.nextInt(1000).toString();
                                        print(b);
                                        url = 'http://numbersapi.com/' + d;
                                      });
                                    },
                                    child: Text("Randam"),
                                  ),
                                  Container(
                                    child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            //a = a + "1";
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
                                            //a = a + "2";
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
                                            //a = a + "3";
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.all(5),
                                          child: Text("3"),
                                        ),
                                      )),
                                    ],
                                  ),
                                  
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                          child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            //a = a + "1";
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
                                            //a = a + "2";
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
                                            //a = a + "3";
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.all(5),
                                          child: Text("6"),
                                        ),
                                      )),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                          child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            //a = a + "1";
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
                                            //a = a + "2";
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
                                            //a = a + "3";
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.all(5),
                                          child: Text("9"),
                                        ),
                                      ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ))
                      ],
                    );
                  }
              }
            }),
      ),
    );
  }
}
