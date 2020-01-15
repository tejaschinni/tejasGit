import 'package:flutter/material.dart';
import 'package:newapp1/Doctor/add.dart';
import 'package:newapp1/bike/owner.dart';
import 'package:newapp1/bike/ownerview.dart';

import 'bike/Ownerlist.dart';
import 'bike/bike.dart';

class PageCon extends StatefulWidget {
  final List<Bikeinfo> blist;
  final Function deleteowmner;
  final Function editowner;

  PageCon(this.blist,this.editowner,this.deleteowmner);
    
  @override
  _PageConState createState() => _PageConState();
}

class _PageConState extends State<PageCon> {
  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Owner(),          
          Owmerview(widget.blist,widget.deleteowmner,widget.editowner),
          Container(
            color: Colors.lightBlue,
          ),
          Container(
            color: Colors.orange,
          ),
          Container(
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
