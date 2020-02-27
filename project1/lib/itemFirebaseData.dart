import 'package:cloud_firestore/cloud_firestore.dart';

class ItemsFirebase{
  final String itemEnglishName;
  final String itemsHindiName;
  final String itemsMarathiName;
  final String itemUnite;
  final double itemQuantity;
  final String itemsPrice;
  final DocumentReference reference;


 // ItemsFirebase({this.itemEnglishName,this.itemsHindiName,this.itemsMarathiName,this.itemUnite,this.itemsPrice,this.itemQuantity});

  ItemsFirebase.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['itemEnglishName'] != null),
        assert(map['itemsHindiName'] != null),
        assert(map['itemsMarathiName'] != null),
        assert(map['itemUnite'] != null),
        assert(map['itemsPrice'] != null),
        assert(map['itemQuantity'] != null),
        itemEnglishName = map['itemEnglishName'],
        itemsHindiName = map['itemsHindiName'],
        itemsMarathiName = map['itemsMarathiName'],
        itemUnite = map['itemUnite'],
        itemQuantity = map['itemQuantity'],
        itemsPrice = map['itemsPrice'];


  ItemsFirebase.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}