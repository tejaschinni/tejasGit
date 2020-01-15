import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'dog.dart';
import 'doglists.dart';

class Newdog extends StatefulWidget {
  @override
  _NewdogState createState() => _NewdogState();
}

class _NewdogState extends State<Newdog> {
  TextEditingController nameController = TextEditingController();
  // TextEditingController weightController = TextEditingController();
  double age = 0;
  double weight = 0;
  bool validator = false;

  List<Dog> dlists = new List();
  Random r = new Random();
  Database database, db;

  @override
  void initState() {
    super.initState();
    initDatabase();
  }

  deleteDog(int index) {
    setState(() {
      dlists.removeAt(index);
    });
  }

  initDatabase() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'pets.db'),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE animal(id INTEGER PRIMARY KEY,name TEXT,age INTEGER,weight INTEGER)");
      },
      version: 1,
    );
    print("database connected ");
  }

  insertDog(Dog dogs) async {
    final Database db = await database;
    await db.insert('animal', dogs.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("sucessfully");
  }

  Future<List<Dog>> dogs() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('animal');

    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
        weight: maps[i]['weight'],
      );
    });
    
  }

  Future<void> deleteDogs(int id) async {
    final db = await database;
    await db.delete(
      'animal',
      where: "id = ?",
      whereArgs: [id],
    );
    print("delete suc");
  }

  Future<void> updateDog(Dog dogs) async {
    final db = await database;

    await db.update(
      'animal',
      dogs.toMap(),
      where: "id =?",
      whereArgs: [dogs.id],
    );
    print("updated");
  }

  void validate()
  {
     if (nameController.text.length> 4 && weight> 10 && age > 10) {
                     setState(() {
                       validator = true;
                     });
                    }
                    else{
                      setState(() {
                        validator = false;
                      });
                    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Dog list"),
      ),
      body: SafeArea(
        child: Container(
          child: Column(children: <Widget>[
            ListTile(
              title: Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  onChanged: (String s) {
                    if (nameController.text.length> 4 && weight> 10 && age > 10) {
                     setState(() {
                       validator = true;
                     });
                    }
                    else{
                      setState(() {
                        validator = false;
                      });
                    }
                  },
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              leading: Text("Name"),
            ),
            ListTile(
              title: Container(
                padding: EdgeInsets.only(right: 5),
                margin: EdgeInsets.all(10),
                child: Slider(
                  
                  divisions: 100,
                  label: weight.toString(),
                  min: 0,
                  max: 100,
                  value: weight,
                  onChanged: (double b) {
                    
                    setState(() {
                      weight = b;
                    });
                    
                  },
                ),
              ),
              leading: Text("Weight"),
            ),
            ListTile(
              title: Container(
                margin: EdgeInsets.all(10),
                child: Slider(                  
                  divisions: 100,
                  label: age.toString(),
                  min: 0,
                  max: 100,
                  value: age,
                  onChanged: (double b) {
                    setState(() {
                      age = b;
                    });
                    validate();
                  },
                ),
              ),
              leading: Text("AGE"),
            ),
            InkWell(
              child: Container(
                  margin: EdgeInsets.all(20),
                  child: RaisedButton(
                    color: validator ? Colors.blueAccent : Colors.grey,
                    child: Text("SAVE"),
                    onPressed: () {
                      if (validator) {
                        final d = Dog(
                          id: r.nextInt(1000),
                          name: nameController.text,
                          age: age.toInt(),
                          weight: weight.toInt(),
                        );
                        insertDog(d);
                        setState(() {
                          nameController.text = ' ';
                          age = 0;
                          weight = 0;
                        });
                      }
                    },
                  )),
            ),
            InkWell(
              child: Container(
                child: RaisedButton(
                  child: Text("List"),
                  onPressed: () async {
                    dlists.clear();
                    dlists = await dogs();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Doglist(dlists, deleteDogs, updateDog)));
                    for (var d in dlists) {
                      print(d.name +
                          " " +
                          d.age.toString() +
                          " " +
                          d.weight.toString());
                    }
                  },
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
