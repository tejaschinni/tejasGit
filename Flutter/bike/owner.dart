import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newapp1/bike/Ownerlist.dart';
import 'package:newapp1/bike/bike.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Owner extends StatefulWidget {
  @override
  _OwnerState createState() => _OwnerState();
}

class _OwnerState extends State<Owner> {
  List<Bikeinfo> blist = new List();
  //final PageController pageController = PageController(initialPage: 0);

  TextEditingController nameController = TextEditingController();
  TextEditingController bikenumController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  double km = 0;
  Database db, database;
  Random r = Random();

  @override
  void initState() {
    super.initState();
    initDatabase();
  }

  initDatabase() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'bike'),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE owner(id INTEGER PRIMARY KEY,name TEXT,bikenumber TEXT,model TEXT)");
      },
      version: 1,
    );
    print("DataBase connected ");
  }

  addowner(Bikeinfo bikes) async {
    final Database db = await database;

    await db.insert('owner', bikes.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("Added ");
  }

  Future<List<Bikeinfo>> bikes() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('owner');
    return List.generate(maps.length, (i) {
      return Bikeinfo(
        id: maps[i]['id'],
        name: maps[i]['name'],
        model: maps[i]['model'],
        bikenumber: maps[i]['bikenumber'],
      );
    });
  }

  Future<void> deleteowner(int id) async {
    final db = await database;
    await db.delete('owner', where: "id=?", whereArgs: [id]);
    print("Delete");
  }

  Future<void> editowner(Bikeinfo b) async {
    final db = await database;

    await db.update('owner', b.toMap(), where: "id=?", whereArgs: [b.id]);
  }

  bool namevalidator = true;
  bool bikevalidator = true;
  bool modelvalidator = true;
  bool validator = false;

  addBike() {
    if (validator) {
      final d = Bikeinfo(
        id: r.nextInt(1000),
        name: nameController.text,
        bikenumber: bikenumController.text,
        model: modelController.text,
      );
      addowner(d);
      setState(() {
        nameController.text = ' ';
        bikenumController.text = '';
        modelController.text = ' ';

        namevalidator = true;
        bikevalidator = true;
        modelvalidator = true;
      });
    }
  }

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
              onTap: () {
                addBike();
              },
              child: Icon(Icons.add),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: InkWell(
              child: Icon(Icons.view_list),
              onTap: () async {
                blist = await bikes();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Owmerview(blist, deleteowner, editowner)));
              },
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
            
          ],
        ),
      ),
    );
  }
}
