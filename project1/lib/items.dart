import 'package:cloud_firestore/cloud_firestore.dart';

class Items {
  final String itemname,unit,price;
  final DocumentReference reference;
  //final bool active;

  Items.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['itemname'] != null),
        assert(map['unit'] != null),
        assert(map['price'] != null),
        itemname = map['itemname'],
        unit = map['unit'],
        price = map['price'];


  Items.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$itemname:$unit:$price>";
}