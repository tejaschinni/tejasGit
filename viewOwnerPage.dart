import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Data/AdminData.dart';
import 'package:my_app/Owner/ownerData.dart';

class ViewOwnerPage extends StatefulWidget {
  final Function handleSignOut;
  final FirebaseUser fireBaseUser;
  final int index;
  final OwnerData ownerlist;
  final Function delete;
  final AdminData record;
  ViewOwnerPage(
      {this.fireBaseUser,
      this.handleSignOut,
      this.delete,
      this.index,
      this.ownerlist,
      this.record});
  @override
  _ViewOwnerPageState createState() => _ViewOwnerPageState();
}

class _ViewOwnerPageState extends State<ViewOwnerPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eddit Owner'),
      ),
      body: Container(
        child: ListTile(
          title: Text(widget.ownerlist.name),
          subtitle: Text(widget.ownerlist.roomno),
          trailing: InkWell(
            child: Icon(Icons.delete),
            onTap: () {
              widget.delete(widget.ownerlist.reference.documentID.toString(),
                  widget.index);
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
