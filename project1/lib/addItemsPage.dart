import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddItemsPage extends StatefulWidget {
  @override
  _AddItemsPageState createState() => _AddItemsPageState();
}

class _AddItemsPageState extends State<AddItemsPage> {
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemunitController = TextEditingController();
  TextEditingController itempriceController = TextEditingController();

  String itemname, unit, price;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Items '),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            insert();
            itempriceController.text = '';
            itemunitController.text = '';
            itemNameController.text = '';
          });
        },
        child: Icon(Icons.save),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                child: TextField(
                  controller: itemNameController,
                  onChanged: (String s){
                    setState(() {
                      itemname = s;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Items Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  controller: itemunitController,
                  onChanged: (String s){
                    setState(() {
                      unit = s;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'unit',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  controller: itempriceController,
                  onChanged: (String s){
                    setState(() {
                      price = s;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'price',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void insert() {
    Firestore.instance
        .collection('Items')
        .document()
        .setData({'itemname': itemname, 'unit': unit, 'price': price});
  }
}
