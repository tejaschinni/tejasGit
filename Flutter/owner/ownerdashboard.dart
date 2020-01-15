import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newapp1/bike/bike.dart';
import 'package:newapp1/owner/addOwner.dart';
import 'package:newapp1/owner/ownerList.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class OwnerDashboard extends StatefulWidget {
  List<Bikeinfo> blist = new List();
  Database db, database;
  Random r = Random();

  OwnerDashboard() {
    print("We are in DashBoard");
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
    blist = await bikes();
    print(blist.length);
  
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
    return  List.generate(maps.length, (i) {
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

  @override
  _OwnerDashboardState createState() => _OwnerDashboardState();
}

class _OwnerDashboardState extends State<OwnerDashboard> {
  final PageController pageController = PageController(initialPage: 0);

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

  addBike() {
    if (validator) {
      final d = Bikeinfo(
        id: r.nextInt(1000),
        name: nameController.text,
        bikenumber: bikenumController.text,
        model: modelController.text,
      );
      widget.addowner(d);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView(
          children: <Widget>[
            Container(
              child: AddOwner(addBike),
            ),
            Container(
              child: OwnerLists(widget.blist, widget.deleteowner, widget.bikes),
            ),
          ],
        ),
      ),
    );
  }
}
