import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newapp1/bike/bike.dart';
import 'package:sqflite/sqflite.dart';

class AddOwner extends StatefulWidget {
  final Function addOwner;
  AddOwner(this.addOwner) {
    print("We are in Add");
  }
  @override
  _AddOwnerState createState() => _AddOwnerState();
}

class _AddOwnerState extends State<AddOwner> {
  //final PageController pageController = PageController(initialPage: 0);

  TextEditingController nameController = TextEditingController();
  TextEditingController bikenumController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  double km = 0;
  Database db, database;
  Random r = Random();

  bool namevalidator = true;
  bool bikevalidator = true;
  bool modelvalidator = true;
  bool validator = false;

  void vaildate() {
    if (namevalidator == false &&
        bikevalidator == false &&
        modelvalidator == false) {
      setState(() {
        validator = true;
      });
    } else {
      setState(() {
        validator = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bike Owner"),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {},
              child: Icon(Icons.add),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: InkWell(
              child: Icon(Icons.view_list),
              onTap: () async {},
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("Owmer"),
                  ),
                  Expanded(
                    flex: 5,
                    child: TextField(
                      controller: nameController,
                      onChanged: (String s) {
                        if (nameController.text.length > 5) {
                          namevalidator = false;
                        } else {
                          namevalidator = true;
                        }
                        vaildate();
                      },
                      decoration: InputDecoration(
                          errorText: namevalidator ? 'enter 3 char' : null,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  //  Slider(
                  //   min: 0,
                  //   max: 100,
                  //   value: km,
                  //   label: km.toString(),
                  //   divisions: 100,
                  //   onChanged: (double d) {
                  //     setState(() {

                  //       km = d;

                  //     });
                  //   },
                  // ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(" Bike Number "),
                  ),
                  Expanded(
                    flex: 5,
                    child: TextField(
                      controller: bikenumController,
                      onChanged: (String s) {
                        if (bikenumController.text.length > 5) {
                          bikevalidator = false;
                        } else {
                          bikevalidator = true;
                        }
                        vaildate();
                      },
                      decoration: InputDecoration(
                          errorText: bikevalidator ? 'enter 3 char' : null,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("Model Name"),
                  ),
                  Expanded(
                    flex: 5,
                    child: TextField(
                      controller: modelController,
                      onChanged: (String s) {
                        if (modelController.text.length > 5) {
                          modelvalidator = false;
                        } else {
                          modelvalidator = true;
                        }
                        vaildate();
                      },
                      decoration: InputDecoration(
                          errorText: modelvalidator ? 'enter 3 char' : null,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: RichText(
                text: TextSpan(text: "hello"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
