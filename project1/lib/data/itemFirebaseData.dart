import 'package:cloud_firestore/cloud_firestore.dart';

class ItemsFirebase{
  final String itemEnglishName;
  final String itemHindiName;
  final String itemMarathiName;
  final String itemsUnite;
  final double itemsQuantity;
  final String itemPrice;
  bool status;
  final DocumentReference reference;


 // ItemsFirebase({this.itemEnglishName,this.itemsHindiName,this.itemsMarathiName,this.itemsUnite,this.itemsPrice,this.itemsQuantity});

  ItemsFirebase.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['itemEnglishName'] != null),
        assert(map['itemHindiName'] != null),
        assert(map['itemMarathiName'] != null),
        assert(map['itemsUnite'] != null),
        assert(map['itemsQuantity'] != null),
        itemEnglishName = map['itemEnglishName'],
        itemHindiName = map['itemHindiName'],
        itemMarathiName = map['itemMarathiName'],
        itemsUnite = map['itemsUnite'],
        itemsQuantity = map['itemsQuantity'],
        status = true,
        itemPrice = map['itemPrice'];


  ItemsFirebase.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}