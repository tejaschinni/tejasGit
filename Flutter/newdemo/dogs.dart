import 'dart:math' as prefix0;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newapp1/newdemo/list.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../dog.dart';

class Dogdata extends StatefulWidget {
  @override
  _DogdataState createState() => _DogdataState();
}

class _DogdataState extends State<Dogdata> {
  List<Dog> doglist = new List();
  TextEditingController nameController = TextEditingController();
  double age = 0;
  double weight = 0;
  Random r = prefix0.Random();
  Database database,db;
  bool validator = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDatabase();
  }


  initDatabase()async{
    database = await openDatabase(
      join(await getDatabasesPath(),'pet.db'),
      onCreate: (db,version){
        return db.execute(
          "CREATE TABLE animal(id INTEGER PRIMARY KEY,name TEXT,age INTEGER,weight INTEGER)"
        );        
      },
      version: 1,
    );
    print("Database Conncted ");
  }
  
  insertDog(Dog dogs) async{
    final Database db = await database;
    await db.insert('animal', dogs.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace);
    print("Insterted ");
  }

  Future<List<Dog>>dogs()async{
    final Database db = await database;

    final List<Map<String,dynamic>>maps = await db.query('animal');
    return List.generate(maps.length, (i){
      return Dog(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
        weight: maps[i]['weight'],
      );
    },
    );
  }

  Future<void>deleteDogs(int id)async{
    final db = await database;
    await db.delete('animal',where: "id = ?",whereArgs:[id]);
    print('Deleted ');
  }

  Future<void>upgradeDog(Dog dog)async{
    final db = await database;

    await db.update('animal', dog.toMap(),
    where: "id=?",whereArgs: [dog.id]);
    print("Updated ");
  }

void validate(){
    if(nameController.text.length>=3 && age >= 10 && weight >= 15){
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
          title: Text("Dog Details"),
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                ListTile(
              title: TextField(
                controller: nameController,
                onChanged: (String s){
                  validate();

                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              leading: Text("Name"),
            ),
            ListTile(
              title: Slider(
              min: 0,
              max: 100,
              value: age,
              label: age.toString(),
              divisions: 100,
              onChanged: (double a){
                setState(() {
                  age = a;
                });
                validate();
              },
            ),
            leading: Text("Age"),
            ),
            ListTile(
              title: Slider(
              min: 0,
              max: 100,
              value: weight,
              label: weight.toString(),
              divisions: 100,
              onChanged: (double b){
                setState(() {
                  weight = b;
                });
                validate();
              },
            ),
            leading: Text("weight"),
            ),
            RaisedButton(
              child: Text("Save"),
              color: validator?Colors.greenAccent:Colors.red,
              onPressed: (){
                if(validator){
                  final d=Dog(
                  id: r.nextInt(1000),
                  name: nameController.text,
                  age: age.toInt(),
                  weight: weight.toInt(),
                );
                insertDog(d);
                }
                
                setState(() {
                  nameController.text=' ';
                  age= 0;
                  weight=0;
                });
              },
            ),
            RaisedButton(
              child: Text("List"),
              onPressed: ()async{
                doglist.clear();
                doglist = await dogs();
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Listed(doglist,deleteDogs,upgradeDog,dogs)));
                for (var d in doglist) {
                  print(d.name+" "+d.age.toString());
                  
                }
              },
            ),

              ],
            )
          ),
        ));
  }
}
