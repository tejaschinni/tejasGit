import 'package:flutter/material.dart';

import '../dog.dart';

class Edited extends StatefulWidget {
  final Dog dog;
  final Function upgradeDog;
  Edited(this.dog,this.upgradeDog);
  @override
  _EditedState createState() => _EditedState();
}

class _EditedState extends State<Edited> {
  TextEditingController nameController = TextEditingController();
  double age = 0;
  double weight = 0;
  bool validator = false;
  
  void initState() {
    // TODO: implement initState
    super.initState();
    age = widget.dog.age.toDouble();
    nameController.text = widget.dog.name.toString();
    weight = widget.dog.weight.toDouble();
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
        title: Text("Edit"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              child: ListTile(
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
              onChanged: (double a){
                setState(() {
                  weight = a;
                });
                validate();
              },
            ),
            leading: Text("Age"),
            ),
            RaisedButton(
              child: Text("Update"),
              color: validator?Colors.blue:Colors.red,
              onPressed: (){
                widget.dog.name = nameController.text;
                widget.dog.age = age.toInt(); 
                widget.dog.weight = weight.toInt(); 
                widget.upgradeDog(widget.dog); 
                Navigator.pop(context);           
                setState(() {
                  nameController.text=' ';
                  age= 0;
                  weight=0;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
