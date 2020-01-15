import 'package:flutter/material.dart';
import 'package:newapp1/Doctor/patient.dart';
import 'package:newapp1/Doctor/viewpatient.dart';

class Patientlist extends StatefulWidget {
  final List<Patient> patlist;
  final Function deletepat;
  final Function edit;
  Patientlist(this.patlist, this.deletepat,this.edit);
  @override
  _PatientlistState createState() => _PatientlistState();
}

class _PatientlistState extends State<Patientlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient List"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              // decoration: BoxDecoration(
              //   shape: BoxShape.circle,
              //   color: Colors.grey,
              // ),
              child: SizedBox(
                width: 400.0,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: widget.patlist.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Container(
                          child: Row(
                        children: <Widget>[
                          SizedBox(),
                          Text(widget.patlist[index].name),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                              onTap: () {
                                widget.deletepat(widget.patlist[index].id);
                                setState(() {
                                  widget.patlist.removeAt(index); 
                                });   
                                                               
                              },
                              child: Icon(Icons.delete)),
                        ],
                      )),
                      trailing: RaisedButton(
                        child: Icon(Icons.view_list),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Viewpat(widget.patlist[index],widget.edit)));
                        },
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
