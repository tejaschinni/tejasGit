import 'package:flutter/material.dart';
import 'package:newapp1/bike/bike.dart';
import 'package:newapp1/bike/ownerview.dart';

class Owmerview extends StatefulWidget {
  final List<Bikeinfo> blist;
  final Function deleteowner;
  final Function editowner;

  Owmerview(this.blist,this.deleteowner,this.editowner);

  @override
  _OwmerviewState createState() => _OwmerviewState();
}

class _OwmerviewState extends State<Owmerview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Owner List "),
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Container(
            child: SizedBox(
                width: 400,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: widget.blist.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Container(
                        child: Row(
                          children: <Widget>[
                            SizedBox(),
                            Text(widget.blist[index].name),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  widget.blist.removeAt(index);
                                });
                                widget.deleteowner(widget.blist[index].id);
                              },
                              child: Icon(Icons.delete),
                            ),
                            SizedBox(width: 10,),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>OwnerV(widget.blist[index],widget.editowner)));
                              },                              
                              child: Icon(Icons.edit),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )),
          )
        ],
      )),
    );
  }
}
