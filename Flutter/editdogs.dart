import 'package:flutter/material.dart';
import 'dog.dart';

class EditDog extends StatefulWidget {
  final Dog dog;
  final Function updateDog;

  EditDog(this.dog, this.updateDog);
  @override
  _EditDogState createState() => _EditDogState();
}

class _EditDogState extends State<EditDog> {
  TextEditingController nameController = TextEditingController();
  //TextEditingController weightController = TextEditingController();
  int age;
  int weight;
  bool validator = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    age = widget.dog.age.toInt();
    nameController.text = widget.dog.name.toString();
    weight = widget.dog.weight.toInt();
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
        title: Text("Update"),
      ),
      body: SafeArea(
        child: Container(
          child: Column(children: <Widget>[
            ListTile(
              title: Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  onChanged: (String s) {
                    validate();
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
                margin: EdgeInsets.all(10),
                child: Slider(
                  divisions: 100,
                  label: weight.toString(),
                  min: 0,
                  max: 100,
                  value: weight.toDouble(),
                  onChanged: (double c) {
                    setState(() {
                      weight = c.toInt();
                    });
                    validate();
                  },
                ),
              ),
              leading: Text("Weight"),
            ),
            ListTile(
              title: Container(
                padding: EdgeInsets.only(),
                margin: EdgeInsets.all(10),
                child: Slider(
                  divisions: 100,
                  label: age.toString(),
                  min: 0,
                  max: 100,
                  value: age.toDouble(),
                  onChanged: (double b) {
                    setState(() {
                      age = b.toInt();
                    });              
                    validate();      
                  },
                ),
              ),
              leading: Text("Age"),
            ),
            InkWell(
              child: Container(
                  margin: EdgeInsets.all(20),
                  child: RaisedButton(
                     color: validator ? Colors.blueAccent : Colors.grey,        
                    child: Text("Update"),
                    onPressed: () {
                      if (validator) {
                        widget.dog.name = nameController.text;
                        widget.dog.age = age.toInt();
                        widget.dog.weight = weight.toInt();
                        widget.updateDog(widget.dog);
                        Navigator.pop(context);
                      }
                      
                    },
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
