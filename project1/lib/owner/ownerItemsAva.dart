import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project1/constant.dart';
import 'package:project1/shopOwner.dart';

class OwnerItemsAvaiable extends StatefulWidget {
  final GoogleSignInAccount _currentUser;
  // final ShopOwner shopowner;
  OwnerItemsAvaiable(this._currentUser);
  @override
  _OwnerItemsAvaiableState createState() => _OwnerItemsAvaiableState();
}

class _OwnerItemsAvaiableState extends State<OwnerItemsAvaiable> {
  ShopOwner shopowner;

  String ownerAdd;
  String userEmail;

  FirebaseUser user;

  List aItem = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cFireBaseAuth.currentUser().then((user) => setState(() {
          this.user = user;
          userEmail = user.email;
        }));
    fectchItemsData();
    // aItem = shopowner.items;
  }

  fectchItemsData() async {
   
   await Firestore.instance.collection('ShopOwner').document(userEmail)
.get().then((DocumentSnapshot doc) {
  
     if(doc.exists)
     {
       setState(() {
         print('ShopOwner/${userEmail}'+"_____________________________________________________________________________________FOUND");
      shopowner = ShopOwner.fromSnapshot(doc);
       });     
     }
     else{
        print('ShopOwner/${userEmail}'"_____________________________________________________________________________________Not FOUND");
     }
}
     
);

    // final QuerySnapshot result = await Firestore.instance
    //     .collection('ShopOwner')
    //     .where(userEmail)
    //     .getDocuments();

    // final List<DocumentSnapshot> document = result.documents;

    // setState(() {
    //   document.forEach((data) {
    //     shopowner = ShopOwner.fromSnapshot(data);
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Select Items '),
        ),
        body: Text(shopowner.shopname)
      );
  }
} 
