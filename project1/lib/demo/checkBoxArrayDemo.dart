import 'package:flutter/material.dart';


class CheckArrayDemo extends StatefulWidget {
  @override
  _CheckArrayDemoState createState() => _CheckArrayDemoState();
}

class _CheckArrayDemoState extends State<CheckArrayDemo> {


   Map<String, bool> numbers = {
    'One' : false,
    'Two' : false,
    'Three' : false,
    'Four' : false,
    'Five' : false,
    'Six' : false,
    'Seven' : false,
  };

  var holder_1 = [];

  getItems(){

    numbers.forEach((key, value) {
      if(value == true)
      {
        holder_1.add(key); 
      }
      });

  // Printing all selected items on Terminal screen.
  print(holder_1);
  // Here you will get all your selected Checkbox items.

  // Clear array after use.
  holder_1.clear();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column (children: <Widget>[

      RaisedButton(
      child: Text(" Get Checked Checkbox Items ", style: TextStyle(fontSize: 20),),
      onPressed: getItems,
      color: Colors.green,
      textColor: Colors.white,
      splashColor: Colors.grey,
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),
      
      Expanded( 
        child :
        ListView(
        children: numbers.keys.map((String key) {
          return new CheckboxListTile(
            title: new Text(key),
            value: numbers[key],
            activeColor: Colors.pink,
            checkColor: Colors.white,
            onChanged: (bool value) {
              setState(() {
                numbers[key] = value;
              });
            },
          );
        }).toList(),
      ),
    ),]),
      
    );
  }
}