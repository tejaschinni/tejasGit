import 'package:cloud_firestore/cloud_firestore.dart';

class ShopOwner {
  final String shopname,shopownername,shopaddress,shopmobile,shoplicense;
  final List itemEngName;
  List items;
  
  final DocumentReference reference;
  //final bool active;

  ShopOwner.fromMap(Map<String, dynamic> map, {this.reference})
      : 
        shopname = map['Shopname'],
        shopownername = map['shopowner'],
        shopaddress = map['shopaddress'],
        shoplicense = map['shoplicense'],
        shopmobile = map['shopmobile'],
        items  = map['items'],
        itemEngName = map['itemEngName'];



  ShopOwner.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  // @override
  // String toString() => "Record<$shopname:$shopownername:$shopaddress:$shopmobile:$shoplicense>";
}
