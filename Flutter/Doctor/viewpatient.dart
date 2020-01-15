import 'package:flutter/material.dart';
import 'package:newapp1/Doctor/patient.dart';

class Viewpat extends StatefulWidget {
  final Patient patient;
  final Function edit;
  Viewpat(this.patient, this.edit);
  @override
  _ViewpatState createState() => _ViewpatState();
}

class _ViewpatState extends State<Viewpat> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController deceasecontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController mediccontroller = TextEditingController();
  double age = 0;
  bool editable = false, validator = false;

  bool namevalidator = true;
  bool agevalidator = true;
  bool deceasevalidator = true;
  bool mobilevalidator = true;
  bool addressvalidator = true;
  bool medicinevalidator = true;

  void validate() {
    if (namevalidator == false &&
        agevalidator == false &&
        medicinevalidator == false &&
        addressvalidator == false &&
        mobilevalidator == false &&
        deceasevalidator == false) {
      setState(() {
        validator = true;
      });
    } else {
      setState(() {
        validator = false;
      });
    }
  }

  update() {
    if (validator) {
      widget.patient.name = namecontroller.text;
      widget.patient.address = addresscontroller.text;
      widget.patient.mob = mobilecontroller.text;
      widget.patient.decease = deceasecontroller.text;
      widget.patient.medic = mediccontroller.text;
      widget.patient.age = age.toInt();
      widget.edit(widget.patient);
      Navigator.pop(context);
    }
    setState(() {
      namevalidator = true;
      addressvalidator = true;
      mobilevalidator = true;
      agevalidator = true;
      deceasevalidator = true;
      medicinevalidator = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    namecontroller.text = widget.patient.name.toString();
    age = widget.patient.age.toDouble();
    addresscontroller.text = widget.patient.address.toString();
    addresscontroller.text = widget.patient.address.toString();
    mobilecontroller.text = widget.patient.mob.toString();
    mediccontroller.text = widget.patient.medic.toString();
    deceasecontroller.text = widget.patient.decease.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient Details "),
        actions: <Widget>[
          InkWell(
            onTap: () {
              update();
            },
            child: Container(
              margin: EdgeInsets.all(15),
              child: Icon(Icons.save,color: validator?Colors.white:Colors.grey,),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                editable = !editable;
              });
            },
            child: Container(
              margin: EdgeInsets.all(15),
              child: Icon(
                Icons.edit,
                color: editable ? Colors.grey : Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("Patient"),
                  ),
                  Expanded(
                    flex: 5,
                    child: TextField(
                      enabled: editable,
                      onChanged: (String s) {
                        if (namecontroller.text.length >= 5) {
                          namevalidator = false;
                        } else {
                          namevalidator = true;
                        }
                        validate();
                      },
                      controller: namecontroller,
                      decoration: InputDecoration(
                          errorText: namevalidator ? 'mendatory' : null,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: ListTile(
                title: Slider(
                  min: 0,
                  max: 100,
                  value: age,
                  label: age.toString(),
                  divisions: 100,
                  activeColor:
                      agevalidator ? Colors.redAccent : Colors.greenAccent,
                  onChanged: (double d) {
                    setState(() {
                      if (age >= 10) {
                        agevalidator = false;
                      } else {
                        agevalidator = true;
                      }
                      age = d;
                      validate();
                    });
                  },
                ),
                leading: Text("Age"),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("Address"),
                  ),
                  Expanded(
                    flex: 5,
                    child: TextField(
                      enabled: editable,
                      controller: addresscontroller,
                      onChanged: (String s) {
                        if (addresscontroller.text.length >= 5) {
                          addressvalidator = false;
                        } else {
                          addressvalidator = true;
                        }
                        validate();
                      },
                      decoration: InputDecoration(
                          errorText: addressvalidator ? 'mendatory' : null,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("Mobile"),
                  ),
                  Expanded(
                    flex: 5,
                    child: TextField(
                      enabled: editable,
                      controller: mobilecontroller,
                      keyboardType: TextInputType.number,
                      onChanged: (String s) {
                        if (mobilecontroller.text.length == 10) {
                          mobilevalidator = false;
                        } else {
                          mobilevalidator = true;
                        }
                        validate();
                      },
                      decoration: InputDecoration(
                          errorText:
                              mobilevalidator ? 'Enter oly 10 digit' : null,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("Decease"),
                  ),
                  Expanded(
                    flex: 5,
                    child: TextField(
                      enabled: editable,
                      controller: deceasecontroller,
                      onChanged: (String s) {
                        setState(() {
                          if (deceasecontroller.text.length >= 5) {
                            deceasevalidator = false;
                          } else {
                            deceasevalidator = true;
                          }
                          validate();
                        });
                      },
                      decoration: InputDecoration(
                          errorText: deceasevalidator ? 'mendatory' : null,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("Medicine"),
                  ),
                  Expanded(
                    flex: 5,
                    child: TextField(
                      enabled: editable,
                      controller: mediccontroller,
                      onChanged: (String s) {
                        setState(() {
                          if (mediccontroller.text.length > 5) {
                            medicinevalidator = false;
                          } else {
                            medicinevalidator = true;
                          }
                          validate();
                        });
                      },
                      decoration: InputDecoration(
                          errorText: medicinevalidator ? 'mendatory' : null,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
