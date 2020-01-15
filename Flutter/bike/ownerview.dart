import 'package:flutter/material.dart';
import 'package:newapp1/bike/bike.dart';

class OwnerV extends StatefulWidget {
  final Bikeinfo blist;
  final Function editowner;
    
  OwnerV(this.blist,this.editowner);
  @override
  _OwnerVState createState() => _OwnerVState();
}

class _OwnerVState extends State<OwnerV> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bikenumController = TextEditingController();
  TextEditingController modelController = TextEditingController();

  bool editable = false;
  bool namevalidator = true;
  bool bikevalidator = true;
  bool modelvalidator = true;
  bool validator = false;

  void vaildate(){
    if(namevalidator == false && bikevalidator == false && modelvalidator == false){
      setState(() {
        validator = true;
      });
    }
    else{
      setState(() {
        validator = false;

      });
    }
  }


   void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = widget.blist.name.toString();
    bikenumController.text = widget.blist.bikenumber.toString();
    modelController.text= widget.blist.model.toString();

  }
@override
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Owner View"), actions: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          child: InkWell(
            
            onTap: () {
              setState(() {
                editable = !editable;
              });              
            },
            child: Icon(Icons.edit,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: InkWell(
            child: Icon(Icons.save),
            onTap: () {
              if(validator){
                widget.blist.name = nameController.text;
                widget.blist.bikenumber = bikenumController.text;
                widget.blist.model = modelController.text; 
                widget.editowner(widget.blist);
                Navigator.pop(context);
              }
              setState(() {
                
              });
            },
          ),
        ),
      ]
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("Owmer"),
                  ),
                  Expanded(
                    flex: 5,
                    child: TextField(
                      controller: nameController,
                      enabled: editable,
                      onChanged: (String s){                        
                          if(nameController.text.length >5){
                          namevalidator = false;
                          }
                        else{
                          namevalidator = true;
                        }
                        vaildate();
                        
                      },
                      decoration: InputDecoration(
                        errorText: namevalidator?'enter mare then 5':null,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  //  Slider(
                  //   min: 0,
                  //   max: 100,
                  //   value: km,
                  //   label: km.toString(),
                  //   divisions: 100,
                  //   onChanged: (double d) {
                  //     setState(() {

                  //       km = d;

                  //     });
                  //   },
                  // ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(" Bike Number "),
                  ),
                  Expanded(
                    flex: 5,
                    child: TextField(
                      controller: bikenumController,
                      enabled: editable,
                      onChanged: (String s){
                        
                          if(bikenumController.text.length > 5){
                          bikevalidator = false;
                        }
                        else{
                          bikevalidator = true;
                        }
                        vaildate();
                       
                      },
                      decoration: InputDecoration(
                        errorText: bikevalidator?'enter mare then 5':null,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("Model Name"),
                  ),
                  Expanded(
                    flex: 5,
                    child: TextField(
                      controller: modelController,
                      enabled: editable,
                      onChanged: (String s){
                      
                          if(modelController.text.length > 5){
                          modelvalidator = false;
                        }
                        else{
                          modelvalidator = true;
                        }
                        vaildate();
                        
                      },
                      decoration: InputDecoration(
                        errorText: modelvalidator?'enter mare then 5':null,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
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
