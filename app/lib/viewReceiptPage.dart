import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Data/receiptData.dart';
import 'package:my_app/Owner/ownerData.dart';

class ViewReceiptPage extends StatefulWidget {
  final FirebaseUser firebaseUser;
  final Function handleSignOut;
  final ReceiptData receiptData;
  final OwnerData ownerData;

  ViewReceiptPage(
      {this.firebaseUser,
      this.handleSignOut,
      this.receiptData,
      this.ownerData});
  @override
  _ViewReceiptPageState createState() => _ViewReceiptPageState();
}

class _ViewReceiptPageState extends State<ViewReceiptPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receipt Data'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text(widget.ownerData.name.toString()),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(widget.receiptData.totalAmount.toString()),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(widget.receiptData.paidAmount.toString()),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(widget.receiptData.pendingAmount.toString()),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(widget.receiptData.acceptedBy.toString()),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(widget.receiptData.date.toString()),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(widget.receiptData.month.toString()),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(widget.receiptData.mode.toString()),
            )
          ],
        ),
      ),
    );
  }
}
