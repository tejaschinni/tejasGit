import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery/auth.dart';
import 'package:grocery/contant.dart';
import 'package:grocery/data/owner.dart';


class OwnerProfile extends StatefulWidget {
  
  final Function handleSignOut;
  OwnerProfile(this.handleSignOut);
  @override
  _OwnerProfileState createState() => _OwnerProfileState();
}

class _OwnerProfileState extends State<OwnerProfile> {

  Owner owner;
  String name;
  FirebaseUser user;
  String userEmail;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
        cFireBaseAuth.currentUser().then((user) => setState(() {
          this.user = user;  
          
        }));
       // name = ' ';
    });
    loadOnwerData();
    fectchItemsData();
  }



  void loadOnwerData()async{
    Firestore.instance.collection('Owner').document(user.email).get().then((DocumentSnapshot ds){
     // print('---------------------'+user.displayName);
      print(ds.documentID);

    });
  }

   fectchItemsData() async {
    final QuerySnapshot result =
        await Firestore.instance.collection('Owner').getDocuments();

    final List<DocumentSnapshot> document = result.documents;
    document.forEach((data) {
  final owner = Owner.fromSnapshot(data);
     print(owner.shopName);
     name = owner.ownerName;
    
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.green,
        actions: <Widget>[
          Container(
            child: InkWell(
              child: Icon(Icons.power_settings_new),
              onTap: (){
                setState(() {
                  widget.handleSignOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AuthPage()));
                });
              },
            ),
          )
        ],
      ),
      body:  Column(
        children: <Widget>[
          Container(
            child: Text(user.email),
          ),
          Container(
            child: Text(name.toString()),
          ),
        ],
      )
      
    );
  }
}
 
