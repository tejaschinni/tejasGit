import 'package:flutter/material.dart';

import 'package:newapp1/editdogs.dart';

import 'dog.dart';

class Doglist extends StatefulWidget {
  final List<Dog> dlists;
  //final Function deleteDog;
  final Function deleteDogs;
  final Function updateDog;
  
  Doglist(this.dlists,this.deleteDogs,this.updateDog);

  @override
  _DoglistState createState() => _DoglistState();
}

class _DoglistState extends State<Doglist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView.builder(
          itemCount: widget.dlists.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.grey.withOpacity(0.2),
              margin: EdgeInsets.all(5),
              child: ListTile(
                trailing: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(widget.dlists[index].age.toString(),style: TextStyle(color: Colors.white),),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle
                  ),
                ),
                title: Row(
                  children: <Widget>[
                    Text(widget.dlists[index].name),
                    SizedBox(width: 10,),
                    Text(widget.dlists[index].weight.toString()),
                    SizedBox(width: 20,),
                    InkWell(
                        onTap: () {                        
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>EditDog(widget.dlists[index],widget.updateDog)));    
                                          
                        },
                        child: Container(                          
                            margin: EdgeInsets.all(10),
                            child: Icon(
                              Icons.edit,
                              color: Colors.green,
                            ))
                            ),
                        
                    InkWell(
                        onTap: () {
                          //widget.deleteDog(index);
                          widget.deleteDogs(widget.dlists[index].id);
                        },
                        child: Container(
                            margin: EdgeInsets.all(10),
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ))),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
