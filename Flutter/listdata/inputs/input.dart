import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class InputDemo extends StatefulWidget {
  @override
  _InputDemoState createState() => _InputDemoState();
}

class _InputDemoState extends State<InputDemo> {
  String value;
  bool agreed = false, nameEdit = false;
  File img;

  TextEditingController nameController = TextEditingController();

  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      img = image;
    });
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      img = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          InkWell(
            onTap: () {
              getImageFromGallery();
            },
            child: Container(
              margin: EdgeInsets.all(5),
              child: Icon(Icons.camera),
            ),
          ),
          InkWell(
            onTap: () {
              getImageFromCamera();
            },
            child: Container(
              margin: EdgeInsets.all(5),
              child: Icon(Icons.camera_alt),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (agreed) {
            print(nameController.text + " " + value);
          }
        },
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              child:
                  img == null ? Image.asset('assets/img.png') : Image.file(img),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, right: 15, left: 15),
              child: TextField(
                enabled: nameEdit,
                controller: nameController,
                decoration: InputDecoration(
                  suffixIcon: Container(
                    child: InkWell(
                        onTap: () {
                          print("object");
                          setState(() {
                            nameEdit = !nameEdit;
                          });
                        },
                        child: Icon(
                          Icons.edit,
                          color: nameEdit ? Colors.blue : Colors.grey,
                        )),
                  ),
                  hintText: 'enter name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.only(left: 5, right: 5),
                child: ListTile(
                  title: Text("Gender"),
                  trailing: DropdownButton<String>(
                    hint: value == null ? Text('select gender') : Text(value),
                    items:
                        <String>['Male', 'Female', 'Other'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String s) {
                      setState(() {
                        value = s;
                      });
                    },
                  ),
                )),
            Container(
              margin: EdgeInsets.all(20),
              child: ListTile(
                title: Text("Agreed  ?"),
                trailing: Switch(
                  value: agreed,
                  onChanged: (bool b) {
                    setState(() {
                      agreed = b;
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
