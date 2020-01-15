import 'package:flutter/material.dart';
import 'package:newapp1/Doctor/patient.dart';

class Listes extends StatefulWidget {
  final List<Patient> patlist;
  Listes(this.patlist);
  @override
  _ListedState createState() => _ListedState();
}

class _ListedState extends State<Listes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ListView.builder(
              itemCount: widget.patlist.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Container(
                    child: Text(widget.patlist[index].name),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
