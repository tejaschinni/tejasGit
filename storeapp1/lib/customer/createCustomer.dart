import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateCustomer extends StatefulWidget {
  @override
  _CreateCustomerState createState() => _CreateCustomerState();
}

class _CreateCustomerState extends State<CreateCustomer> {
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  File _image;

  String firstname, lastname, address, mobile, userEmail;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Customer Details'),
        actions: <Widget>[
          InkWell(
            onTap: () {
              // setState(() {
              //   if(userEmail != null){
              //     Navigator.push(
              //       context, MaterialPageRoute(builder: (context) => Demo(widget.handleSignOut,widget._currentUser)));
              //   }
              //   else{
                  
              //   }
                
              // });
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: Icon(Icons.view_list),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          child: InkWell(
        onTap: () {
          setState(() {
            insert();
            fnameController.text = '';
            lnameController.text = '';
            mobileController.text = '';
            addressController.text = '';
          });
        },
        child: Container(
          height: 40,
          color: Colors.green,
          child: Center(
              child: Text(
            "Prossed to Continue",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          )),
        ),
      )),
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Stack(
          children: <Widget>[
            InkWell(
              child: ClipPath(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/wallpaper.jpg',
                          ),
                          fit: BoxFit.fill)),
                ),
                clipper: BottomWaveClipper(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 150),
              child: Container(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                      backgroundColor: Colors.yellow,
                      maxRadius: 70,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            getImage();
                          });
                        },
                        child: _image == null
                            ? Text('No image selected.')
                            : CircleAvatar(
                                backgroundImage: FileImage(
                                  _image,
                                ),
                                maxRadius: 60,
                              ),
                      ))),
            ),
            Container(
              padding: EdgeInsets.only(top: 170),
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.center,
                padding: EdgeInsets.only(top: 140),
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(15),
                    child: TextField(
                      controller: fnameController,
                      onChanged: (String s) {
                        setState(() {
                          firstname = s;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: ' First Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: TextField(
                      controller: lnameController,
                      onChanged: (String s) {
                        setState(() {
                          lastname = s;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: ' Last Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: TextField(
                      controller: mobileController,
                      onChanged: (String s) {
                        setState(() {
                          mobile = s;
                        });
                      },
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintText: ' Mobile No.',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.all(15),
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //         hintText: 'Email',
                  //         border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(10))),
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: TextField(
                      controller: addressController,
                      onChanged: (String s) {
                        setState(() {
                          address = s;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: 'Address',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
   void insert() {
    Firestore.instance.collection('Customer').document().setData(
        {'firstname': firstname, 'lastname': lastname, 'mobile': mobile, 'address': address});
    print("Created");
  }
}
class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 110);
    path.lineTo(
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
