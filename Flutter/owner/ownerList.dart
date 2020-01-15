import 'package:flutter/material.dart';
import 'package:newapp1/bike/bike.dart';

class OwnerLists extends StatefulWidget {
   List<Bikeinfo> blist;
  final Function deleteowner;
  final Function bikes;
  OwnerLists(this.blist,this.deleteowner,this.bikes);
  @override
  _OwnerListsState createState() => _OwnerListsState();
}

class _OwnerListsState extends State<OwnerLists> {
  @override

  
  void initState() {
    // TODO: implement initStat

    super.initState();
    //widget.blist =  widget.bikes();
   
  }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Owner List "),
        actions: <Widget>[
          InkWell(
            onTap: (){
              print(widget.blist.length);
            },
            child: Icon(Icons.add),
          )
        ],
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
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>OwnerV(widget.blist[index],widget.editowner)));
                              },                              
                              child: Icon(Icons.edit),
                            ),
                            
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