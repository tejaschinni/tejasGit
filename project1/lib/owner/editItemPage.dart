import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project1/data/itemFirebaseData.dart';
import 'package:project1/litemDataType.dart';

class EditItemPage extends StatefulWidget {
  
  DocumentSnapshot data;
  EditItemPage({this.data});

  @override
  _EditItemPageState createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
  TextEditingController itemHindiNameController = TextEditingController();
  TextEditingController itemUnitController = TextEditingController();
  TextEditingController itemQuantityController = TextEditingController();
  TextEditingController itemEnglishNameController = TextEditingController();
  TextEditingController itemMarathiNameController = TextEditingController();
   TextEditingController itemPriceController = TextEditingController();

  String itemEnglishName, unit,itemMarathiName,itemHindiName,quantity,price;
  //Items items;

  ItemsFirebase itemsFirebase;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final listitem = ItemsFirebase.fromSnapshot(widget.data);
    itemHindiNameController.text = listitem.itemHindiName;
    itemEnglishNameController.text = listitem.itemEnglishName;
    itemMarathiNameController.text = listitem.itemMarathiName;
    itemQuantityController.text = listitem.itemsQuantity.toString();
    itemUnitController.text = listitem.itemsUnite;

    setState(() {
      itemEnglishName = listitem.itemEnglishName;
      itemMarathiName = listitem.itemMarathiName;
      itemHindiName = listitem.itemHindiName;
      quantity = listitem.itemsQuantity.toString();
      unit = listitem.itemsUnite;
      price = listitem.itemPrice;
    });

   // print(itemlist.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Items '),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: InkWell(
              child: Icon(Icons.delete_forever),
              onTap: (){
                setState(() {
                  delete();
                  Navigator.pop(context);
                });
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
           // insert();
           editItems();
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
                  controller: itemUnitController,
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
                  controller: itemQuantityController,
                  onChanged: (String s){
                    setState(() {
                      quantity = s;
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
                  keyboardType: TextInputType.number,
                  onChanged: (String s){
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


void editItems(){
Firestore.instance.collection('itemList').document(widget.data.documentID).updateData({'itemPrice':price});
print(price);
}



void delete() async {
    Firestore.instance
        .collection('itemList')
        .document(widget.data.documentID)
        .delete()
        .catchError((onError) {
      print(onError);
    });
}
  // void insert() {
  //   // Firestore.instance
  //   //     .collection('Items')
  //   //     .document()
  //   //     .setData({'itemname': itemEnglishName, 'unit': unit, 'price': price});
  // }
}
