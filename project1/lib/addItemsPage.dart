import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project1/listOfItemPage.dart';
import 'package:project1/litemDataType.dart';

class AddItemsPage extends StatefulWidget {
  
 final List<Items> items;
  AddItemsPage({this.items});

  @override
  _AddItemsPageState createState() => _AddItemsPageState();
}

class _AddItemsPageState extends State<AddItemsPage> {
  TextEditingController itemHindiNameController = TextEditingController();
  TextEditingController itemunitController = TextEditingController();
  TextEditingController itempriceController = TextEditingController();
  TextEditingController itemEnglishNameController = TextEditingController();
  TextEditingController itemMarathiNameController = TextEditingController();

  String itemEnglishName, unit, price,itemMarathiName,itemHindiName,listitem;
  //Items items;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    setState(() {
      for (var i = 0; i < widget.items.length; i++) {
       // itemEnglishName = widget.items[i].itemEnglishName;   
        print(widget.items[i].itemEnglishName);     
      }
    
    });

    print('Items Number '+widget.items.length.toString());
    
   // print(itemlist.toString());
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
            itemEnglishNameController.text = '';
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
                  controller: itemEnglishNameController,
                  onChanged: (String s){
                    setState(() {
                      itemEnglishName = s;
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
                  controller: itemMarathiNameController,
                  onChanged: (String s){
                    setState(() {
                      itemMarathiName = s;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'ItemMarathi Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  controller: itemHindiNameController,
                  onChanged: (String s){
                    setState(() {
                      itemHindiName = s;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Item Hindi Name',
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
        .setData({'itemname': itemEnglishName, 'unit': unit, 'price': price});
  }
}
