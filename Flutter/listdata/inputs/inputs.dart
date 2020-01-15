import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  String value = 'Male';
  bool agreed = false, nameEdi= false;

  TextEditingController  namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(agreed){
            print(namecontroller.text + " "+ value);
          }
        },
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Container(
                margin: EdgeInsets.only(top: 30,right: 5,left: 5),
                child: TextField(
                  enabled: nameEdi,
                  controller: namecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                ),
              ),
              trailing: Container(
                margin: EdgeInsets.only(top: 30),
                child: InkWell(
                  onTap: (){
                    print("object");
                    setState(() {
                     nameEdi =  !nameEdi; 
                    });
                  },
                  child: Icon(Icons.edit,color: nameEdi?Colors.blue:Colors.grey,),
                ),
              ),
            ),
            Container(
              child: ListTile(
                title: Text("Gender"),
                trailing: DropdownButton<String>(
                  items: <String>['Male','Famele','other'].map((String value){
                    return DropdownMenuItem<String>(value: value,
                    child:Text(value));
                  }).toList(),
                  onChanged: (String s){
                    setState(() {
                     value = s; 
                    });
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: ListTile(
                title: Text("Agreed ?"),
                trailing: Switch(
                  value: agreed,
                  onChanged: (bool b){
                    setState(() {
                     agreed =  b; 
                    });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}