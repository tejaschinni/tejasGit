import 'package:cloud_firestore/cloud_firestore.dart';

class ShopOwner {
  final String shopname,shopownername,shopaddress,shopmobile,shoplicense;
  final DocumentReference reference;
  //final bool active;

  ShopOwner.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['shopname'] != null),
        assert(map['shopownername'] != null),
        assert(map['shopaddress'] != null),
        assert(map['shopmobile'] != null),
        assert(map['shoplicense'] != null),
        shopname = map['shopname'],
        shopownername = map['shopownername'],
        shopaddress = map['shopaddress'],
        shoplicense = map['shoplicense'],
        shopmobile = map['shopmobile'];


  ShopOwner.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$shopname:$shopownername:$shopaddress:$shopmobile:$shoplicense>";
}
