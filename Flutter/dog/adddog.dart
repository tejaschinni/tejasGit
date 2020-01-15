
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'dog.dart';
import 'doglist.dart';

import 'package:path/path.dart';

class DogA extends StatefulWidget {
  @override
  _DogAState createState() => _DogAState();
}



class _DogAState extends State<DogA> {
  double age = 0;
  List<Dog> dlist = new List();
  Random r = new Random();
  Database database,db;

  @override
  void initState() { 
    super.initState();
    initDatabase();
  }

  deleteDog(int index)
  {
    setState(() {
     dlist.removeAt(index); 
    });
  }

 initDatabase() async {
   database = await openDatabase(
     join(await getDatabasesPath(),'pet.db'),
     onCreate: (db,version){
       return db.execute("CREATE TABLE dog (id INTERGER PRIMARY KEY,name TEXT,age INTERGER)",
       );
     },
     version: 1,
   );
   print("conneted succcessfully");
 }

 insertDog(Dog dog)async {
   final Database db = await database;
   await db.insert('dog',dog.toMap(),
   conflictAlgorithm: ConflictAlgorithm.replace);
   print("sucessfully");
 }

 Future<List<Dog>> dog() async{
   final Database db = await database;

   final List<Map<String, dynamic>> maps = await db.query('dog');

   return List.generate(maps.length, (i){
     return Dog(id: maps[i]['id'],
     name: maps[i]['name'],
     age: maps[i]['age']
     );
   });
 }

  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dog"),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Slider(
                  divisions: 100,
                  label: age.toString(),
                  min: 0,
                  max: 100,
                  value: age,
                  onChanged: (double d) {
                    setState(() {
                      age = d;
                    });
                  },
                ),
              ),
              RaisedButton(
                child: Icon(Icons.save),
                onPressed: () {
                  if (nameController.text.length > 3) {
                    // print(nameController.text);
                    // print(age.toString());

                    int id = r.nextInt(10000);
                    String name = nameController.text;
                    int ag = age.toInt();

                    Dog d = new Dog(id: id,name: name,age:ag);
                    dlist.add(d);
                    insertDog(d);
                    setState(() {
                      nameController.text = '';
                      
                    });
                  }
                },
              ),
              RaisedButton(
                child: Text("List"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Doglist(dlist,deleteDog)));
                  for (var i in dlist) {
                    print(i.name);
                  }
                },
              ),
              InkWell(
                onTap: () async {
                  dlist.clear();
                  dlist = await dog();

                  for(var d in dlist){
                    print(d.name+"  "+d.age.toString());
                  }
                },
                child: Container(
                  child: Icon(Icons.save_alt),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
