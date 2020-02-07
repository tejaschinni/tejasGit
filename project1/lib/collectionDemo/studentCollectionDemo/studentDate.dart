import 'package:cloud_firestore/cloud_firestore.dart';

class StudentData {
  final String sname;
  final int m1, m2, m3, total,roll;
  final double per;
  final DocumentReference reference;

  StudentData.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['sname'] != null),
        assert(map['m1'] != null),
        assert(map['m2'] != null),
        assert(map['m3'] != null),
        assert(map['total'] != null),
        assert(map['per'] != null),
        assert(map['roll'] != null),
        sname = map['sname'],
        m1 = map['m1'],
        m2 = map['m2'],
        m3 = map['m3'],
        total = map['total'],
        roll = map['roll'],
        per = map['per'];

  StudentData.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$sname:$m1:$m2:$m3:$total:$per:$roll>";
}
