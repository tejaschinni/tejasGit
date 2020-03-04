import 'package:cloud_firestore/cloud_firestore.dart';

class Customer {
  final String fname,lname,address,mobile;
  final DocumentReference reference;
  //final bool active;

  Customer.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['fname'] != null),
        assert(map['lname'] != null),
        assert(map['mobile'] != null),
        assert(map['address'] != null),
        fname = map['fname'],
        lname = map['lname'],
        mobile = map['mobile'],
        address = map['address'];


  Customer.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$fname:$lname:$mobile:$address>";
}
