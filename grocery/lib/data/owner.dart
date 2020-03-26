

import 'package:cloud_firestore/cloud_firestore.dart';

class Owner {
  final String ownerName,shopName,shopAddress,mobile,shopLicense;
  final List items;

  final DocumentReference reference;


  Owner.fromMap(Map<String, dynamic> map, {this.reference})
  :
  shopName = map['shopName'],
        ownerName = map['ownerName'],
        shopAddress = map['shopAddress'],
        shopLicense = map['shopLicense'],
        mobile = map['mobile'],
        items =map['items'];
    

         Owner.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
      

}