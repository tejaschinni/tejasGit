import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project1/shopOwner.dart';


class OwnerItemsAvaiable extends StatefulWidget {
  // final ShopOwner shopowner;
  // OwnerItemsAvaiable(this.shopowner);
  @override
  _OwnerItemsAvaiableState createState() => _OwnerItemsAvaiableState();
}

class _OwnerItemsAvaiableState extends State<OwnerItemsAvaiable> {
  ShopOwner shopowner;

  List <String>item = List();
  @override
  void initState() {
    item.clear();
    // TODO: implement initState
    super.initState();
    setState(() {
      fectchItemsData();
    });
  }
   fectchItemsData() async {
    final QuerySnapshot result =
        await Firestore.instance.collection('ShopOwner').where('tejaschinni14@gmail.com').getDocuments();

    final List<DocumentSnapshot> document = result.documents;
    document.forEach((data) {
      shopowner = ShopOwner.fromSnapshot(data);

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Items '),
      ),
      body: Text(shopowner.shopaddress)
    );
  }
}