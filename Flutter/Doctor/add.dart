import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newapp1/Doctor/list.dart';
import 'package:newapp1/Doctor/patient.dart';
import 'package:newapp1/Doctor/patientlist.dart';
import 'package:newapp1/newdemo/list.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AddP extends StatefulWidget {
  @override
  _AddPState createState() => _AddPState();
}

class _AddPState extends State<AddP> {
  List<Patient> patlist = new List();

  TextEditingController namecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController deceasecontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController mediccontroller = TextEditingController();
  double age = 0;
  Random r = Random();
  Database database, db;
  bool validator = false;

  bool addressValidator = true;
  bool namevalidator = true;
  bool deceasevalidator = true;
  bool agevalidator = true;
  bool medicinevalidator = true;
  bool mobilevalidator = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDatabase();
  }

  initDatabase() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'doctor'),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE patient(id INTEGER PRIMARY KEY,name TEXT,age INREGER,mob TEXT, address TEXT,decease TEXT,medic TEXT)");
      },
      version: 1,
    );
    print("Database connected ");
  }

  addpatient(Patient patients) async {
    final Database db = await database;
    await db.insert('patient', patients.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("Patient Added");
  }

  Future<List<Patient>> patients() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('patient');

    return List.generate(maps.length, (i) {
      return Patient(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
        mob: maps[i]['mob'],
        address: maps[i]['address'],
        decease: maps[i]['decease'],
        medic: maps[i]['medic'],
      );
    });
  }

  Future<void> deletepat(int id) async {
    final Database db = await database;
    await db.delete('patient', where: "id=?", whereArgs: [id]);
    print("delete done");
  }

  Future<void> edit(Patient pat) async {
    final Database db = await database;

    await db.update('patient', pat.toMap(), where: "id=?", whereArgs: [pat.id]);
    print("Updated ");
  }

  void validate() {
    if (namevalidator == false &&
        addressValidator == false &&
        agevalidator == false &&
        mobilevalidator == false &&
        deceasevalidator == false &&
        medicinevalidator == false) {
      setState(() {
        validator = true;
      });
    } else {
      setState(() {
        validator = false;
      });
    }
    print("________________Validator Changed_______________________" +
        validator.toString());
  }

  addPatient() {
    if (validator) {
      final d = Patient(
        id: r.nextInt(100),
        name: namecontroller.text,
        age: age.toInt(),
        mob: mobilecontroller.text,
        address: addresscontroller.text,
        decease: deceasecontroller.text,
        medic: mediccontroller.text,
      );
      addpatient(d);
      setState(() {
        namecontroller.text = " ";
        age = 0;
        mobilecontroller.text = " ";
        addresscontroller.text = " ";
        deceasecontroller.text = " ";
        mediccontroller.text = " ";

        namevalidator = true;
        addressValidator = true;
        agevalidator = true;
        mobilevalidator = true;
        deceasevalidator = true;
        medicinevalidator = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient Details"),
        actions: <Widget>[
          InkWell(
            onTap: () {
              addPatient();
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: Icon(Icons.add,
                  color: validator ? Colors.white : Colors.grey),
            ),
          ),
          InkWell(
            onTap: () async {
              patlist = await patients();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Patientlist(patlist, deletepat, edit)));
              for (var c in patlist) {
                print(c.name);
              }
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: Icon(Icons.list),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("Patient"),
                  ),
                  Expanded(
                    flex: 5,
                    child: TextField(
                      controller: namecontroller,
                      onChanged: (String s) {
                        setState(() {
                          if (namecontroller.text.length >= 5) {
                            namevalidator = false;
                          } else {
                            namevalidator = true;
                          }
                          validate();
                        });
                      },
                      decoration: InputDecoration(
                          errorText: namevalidator ? 'mendatory' : null,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: ListTile(
                title: Slider(
                  min: 0,
                  max: 100,
                  value: age,
                  label: age.toString(),
                  divisions: 100,
                  activeColor:
                      agevalidator ? Colors.redAccent : Colors.greenAccent,
                  onChanged: (double d) {
                    setState(() {
                      if (age >= 10) {
                        agevalidator = false;
                      } else {
                        agevalidator = true;
                      }
                      age = d;
                      validate();
                    });
                  },
                ),
                leading: Text("Age"),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("Address"),
                  ),
                  Expanded(
                    flex: 5,
                    child: TextField(
                      controller: addresscontroller,
                      onChanged: (String s) {
                        setState(() {
                          if (addresscontroller.text.length >= 5) {
                            addressValidator = false;
                          } else {
                            addressValidator = true;
                          }
                          validate();
                        });
                      },
                      decoration: InputDecoration(
                          errorText: addressValidator ? 'mendatory' : null,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("Mobile"),
                  ),
                  Expanded(
                    flex: 5,
                    child: TextField(
                      controller: mobilecontroller,
                      keyboardType: TextInputType.number,
                      onChanged: (String s) {
                        setState(() {
                          if (mobilecontroller.text.length == 10) {
                            mobilevalidator = false;
                          } else {
                            mobilevalidator = true;
                          }
                          validate();
                        });
                      },
                      decoration: InputDecoration(
                          errorText:
                              mobilevalidator ? 'enter only 10 digit ' : null,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("Decease"),
                  ),
                  Expanded(
                    flex: 5,
                    child: TextField(
                      controller: deceasecontroller,
                      onChanged: (String s) {
                        setState(() {
                          if (deceasecontroller.text.length > 5) {
                            deceasevalidator = false;
                          } else {
                            deceasevalidator = true;
                          }
                          validate();
                        });
                      },
                      decoration: InputDecoration(
                          errorText: deceasevalidator ? 'mendatory ' : null,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("Medicine"),
                  ),
                  Expanded(
                    flex: 5,
                    child: TextField(
                      controller: mediccontroller,
                      onChanged: (String s) {
                        setState(() {
                          if (mediccontroller.text.length > 5) {
                            medicinevalidator = false;
                          } else {
                            medicinevalidator = true;
                          }
                          validate();
                        });
                      },
                      decoration: InputDecoration(
                          errorText: medicinevalidator ? 'mendatory ' : null,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
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
