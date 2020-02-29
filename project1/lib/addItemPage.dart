import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project1/itemFirebaseData.dart';
import 'package:project1/listOfItemPage.dart';
import 'package:project1/litemDataType.dart';

class AddItemPage extends StatefulWidget {
  // DocumentSnapshot data;
  // AddItemPage({this.data});

  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  TextEditingController itemHindiNameController = TextEditingController();
  TextEditingController itemUnitController = TextEditingController();
  TextEditingController itemQuantityController = TextEditingController();
  TextEditingController itemEnglishNameController = TextEditingController();
  TextEditingController itemMarathiNameController = TextEditingController();
  TextEditingController itemPriceController = TextEditingController();

  String itemEnglishName, unit, itemMarathiName, itemHindiName,  price;
  double quantity ; 
  //Items items;

  // ItemsFirebase itemsFirebase;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // final listitem = ItemsFirebase.fromSnapshot(widget.data);
    // itemHindiNameController.text = listitem.itemHindiName;
    // itemEnglishNameController.text = listitem.itemEnglishName;
    // itemMarathiNameController.text = listitem.itemMarathiName;
    // itemQuantityController.text = listitem.itemsQuantity.toString();
    // itemUnitController.text = listitem.itemsUnite;

    setState(() {
      // itemEnglishName = listitem.itemEnglishName;
      // itemMarathiName = listitem.itemMarathiName;
      // itemHindiName = listitem.itemHindiName;
      // quantity = listitem.itemsQuantity.toString();
      // unit = listitem.itemsUnite;
      // price = listitem.itemPrice;
    });

    // print(itemlist.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Items '),
        actions: <Widget>[],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            insert();

            Navigator.pop(context);
            // itemQuantityController.text = '';
            // itemUnitController.text = '';
            // itemEnglishNameController.text = '';
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
                  onChanged: (String s) {
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
                  onChanged: (String s) {
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
                  onChanged: (String s) {
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
                  controller: itemUnitController,
                  onChanged: (String s) {
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
                  controller: itemQuantityController,
                  onChanged: (String s) {
                    setState(() {
                      quantity = double.parse(s);
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Quantity',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Container(
                child: TextField(
                  controller: itemPriceController,
                  onChanged: (String s) {
                    setState(() {
                      price = s;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Price',
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
    Firestore.instance.collection('itemList').document().setData({
      'itemEnglishName': itemEnglishName,
      'itemMarathiName': itemMarathiName,
      'itemHindiName': itemHindiName,
      'itemsUnite': unit,
      'itemPrice': price,
      'itemsQuantity':quantity
    });
    print("inserted");
  }
}
