import 'package:cloud_firestore/cloud_firestore.dart';

class AdminData {
  final String name;
  final String address;
  final String mobile;
  List ownerRef;
  final DocumentReference reference;

  // AdminData({this.itemEnglishName,this.itemsHindiName,this.itemsMarathiName,this.itemsUnite,this.itemsPrice,this.itemsQuantity});

  AdminData.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['address'] != null),
        assert(map['mobile'] != null),
        name = map['name'],
        address = map['address'],
        mobile = map['mobile'],
        ownerRef = map['ownerRef'];

  AdminData.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
