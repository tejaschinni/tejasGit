import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/Data/AdminData.dart';
import 'package:my_app/Data/receiptData.dart';
import 'package:my_app/Maintain/viewReceiptPage.dart';
import 'package:my_app/Owner/ownerData.dart';

class ViewOwnerPage extends StatefulWidget {
  final Function handleSignOut;
  final FirebaseUser fireBaseUser;
  final int index;
  OwnerData ownerData;
  final Function delete;
  final AdminData record;
  ViewOwnerPage(
      {this.fireBaseUser,
      this.handleSignOut,
      this.delete,
      this.index,
      this.ownerData,
      this.record});
  @override
  _ViewOwnerPageState createState() => _ViewOwnerPageState();
}

class _ViewOwnerPageState extends State<ViewOwnerPage> {
  int mode = 1;
  String finalDate = '', modeOfPay, month;
  int paidAmount, totalAmount, pendingAmount;

  TextEditingController totalAmountController = TextEditingController();
  TextEditingController paidAmountController = TextEditingController();
  TextEditingController modePaymentController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  List temp = List();

  ReceiptData receiptData;

  List<ReceiptData> receiptList = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalAmount = int.parse(widget.ownerData.maintaincesAmount);
    getCurrentDate();
    fetchReceipt();
  }

  getCurrentDate() {
    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

    setState(() {
      finalDate = formattedDate.toString();
    });
  }

  _addReceipt(BuildContext context) async {
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: <Widget>[
              Container(
                child: Text(totalAmount.toString()),
              ),
              // Container(
              //   margin: EdgeInsets.all(15),
              //   child: TextField(
              //     controller: totalAmountController,
              //     onChanged: (String s) {
              //       setState(() {
              //         totalAmount = int.parse(s);
              //       });
              //     },
              //     keyboardType: TextInputType.number,
              //     decoration: InputDecoration(
              //       hintText: 'Total Amount to be paid',
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(20)),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: TextField(
                  controller: paidAmountController,
                  onChanged: (String s) {
                    setState(() {
                      paidAmount = int.parse(s);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Amount Paided',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: TextField(
                  controller: monthController,
                  onChanged: (String s) {
                    setState(() {
                      month = s;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Month ',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: TextField(
                  controller: modePaymentController,
                  onChanged: (String s) {
                    setState(() {
                      modeOfPay = s;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Mode Of Payment',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 5,
              // ),
              // DropdownButton(
              //     value: mode,
              //     items: [
              //       DropdownMenuItem(
              //         child: Text('paid_by_Cash'),
              //         value: 1,
              //       ),
              //       DropdownMenuItem(
              //         child: Text(' paid_by_Check'),
              //         value: 2,
              //       ),
              //     ],
              //     onChanged: (value) {
              //       setState(() {
              //         mode = value;
              //       });
              //     }),
              // SizedBox(
              //   height: 5,
              // ),
              Container(
                margin: EdgeInsets.all(15),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      pendingAmount = totalAmount - paidAmount;

                      pushReceipt();

                      Navigator.pop(context);
                    },
                    child: ListTile(
                      title: Text(
                        'Save',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Owner'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: ListTile(
                  title: Text(widget.ownerData.name),
                  subtitle: Text(widget.ownerData.receiptRef.toString()),
                  trailing: InkWell(
                    child: Icon(Icons.receipt),
                    onTap: () {
                      _addReceipt(context);
                    },
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 9,
                child: Container(
                  child: ListView.builder(
                      itemCount: receiptList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Paided Amount Month of ' +
                              receiptList[index].month.toString() +
                              ' ' +
                              receiptList[index].paidAmount.toString()),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewReceiptPage(
                                          firebaseUser: widget.fireBaseUser,
                                          handleSignOut: widget.handleSignOut,
                                          ownerData: widget.ownerData,
                                          receiptData: receiptList[index],
                                        )));
                          },
                        );
                      }),
                ))
          ],
        ),
      ),
    );
  }

  pushReceipt() async {
    final receiptRef = await Firestore.instance
        .collection('maintain')
        .document(widget.fireBaseUser.email)
        .collection('receipt')
        .add({
      'totalAmount': totalAmount,
      'paidAmount': paidAmount,
      'pendingAmount': pendingAmount,
      'mode': modeOfPay,
      'month': month,
      'accepted_by': widget.fireBaseUser.email.toString(),
      'date': DateTime.now(),
    });

    temp.add(receiptRef.documentID.toString());

    Firestore.instance
        .collection('maintain')
        .document(widget.fireBaseUser.email.toString())
        .collection('owner')
        .document(widget.ownerData.reference.documentID.toString())
        .updateData({
      'receiptRef': FieldValue.arrayUnion([receiptRef.documentID.toString()])
    });
  }

  fetchReceipt() async {
    for (int i = 0; i < widget.ownerData.receiptRef.length; i++) {
      Firestore.instance
          .collection('maintain')
          .document(widget.fireBaseUser.email.toString())
          .collection('receipt')
          .document(widget.ownerData.receiptRef[i].toString())
          .get()
          .then((DocumentSnapshot ds) {
        setState(() {
          ReceiptData rd = ReceiptData.fromSnapshot(ds);
          receiptList.add(rd);
        });
      });
    }
    // final QuerySnapshot result = await Firestore.instance
    //     .collection('maintain')
    //     .document(widget.fireBaseUser.email)
    //     .collection('receipt')
    //     .getDocuments();

    // final List<DocumentSnapshot> documents = result.documents;

    // documents.forEach((data) {
    //   final receiptRecord = ReceiptData.fromSnapshot(data);
    //   setState(() {
    //     receiptList.add(receiptRecord);
    //   });

    print('--------------------------------fetch Data fuction was called');
  }
}
