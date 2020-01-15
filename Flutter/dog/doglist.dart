import 'package:flutter/material.dart';

import 'dog.dart';

class Doglist extends StatefulWidget {
  final List<Dog> dlist;
  final Function deleteDog;
  Doglist(this.dlist, this.deleteDog);

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
          itemCount: widget.dlist.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.grey.withOpacity(0.2),
              margin: EdgeInsets.all(5),
              child: ListTile(
                trailing: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(widget.dlist[index].age.toString(),style: TextStyle(color: Colors.white),),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle
                  ),
                ),
                title: Row(
                  children: <Widget>[
                    Text(widget.dlist[index].name),
                    SizedBox(width: 20,),
                    InkWell(
                        onTap: () {
                         
                        },
                        child: Container(
                            margin: EdgeInsets.all(10),
                            child: Icon(
                              Icons.edit,
                              color: Colors.green,
                            ))),
                    InkWell(
                        onTap: () {
                          widget.deleteDog(index);
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
