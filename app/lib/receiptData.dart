import 'package:cloud_firestore/cloud_firestore.dart';

class ReceiptData {
  final int totalAmount, paidAmount, pendingAmount;
  final Timestamp date;
  final String month, acceptedBy, mode;
  List ownerRef;
  final DocumentReference reference;

  // AdminData({this.itemEnglishName,this.itemsHindiName,this.itemsMarathiName,this.itemsUnite,this.itemsPrice,this.itemsQuantity});

  ReceiptData.fromMap(Map<String, dynamic> map, {this.reference})
      : totalAmount = map['totalAmount'],
        paidAmount = map['paidAmount'],
        acceptedBy = map['acceptedBy'],
        month = map['month'],
        mode = map['mode'],
        date = map['date'],
        pendingAmount = map['pendingAmount'];

  ReceiptData.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
