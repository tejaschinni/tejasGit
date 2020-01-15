import 'package:flutter/material.dart';

class Data extends StatefulWidget {
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  int a = 0, b = 0, c = 0, add = 0;
  String gr="";
  double per = 0;
  Color bg;

  TextEditingController roll = TextEditingController();
  TextEditingController m1 = TextEditingController();
  TextEditingController m2 = TextEditingController();
  TextEditingController m3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      appBar: AppBar(
        title: Text("Data"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         op();
                 },
                 child: Icon(Icons.save_alt),
               ),
               body: SafeArea(
                 child: Container(
                   child: Column(
                     children: <Widget>[
                       Expanded(
                         child: Row(
                           children: <Widget>[
                             Expanded(
                               child: TextField(
                                 controller: roll,
                                 decoration: InputDecoration(
                                     hintText: 'enter roll',
                                     border: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(20))),
                               ),
                             ),
                             Expanded(
                               child: TextField(
                                 onChanged: (_){
                                    op();
                                 },
                                 controller: m1,
                                 decoration: InputDecoration(                          
                                     hintText: 'math 1 marks',
                                     border: OutlineInputBorder(                              
                                         borderRadius: BorderRadius.circular(20))),
                               ),
                             ),
                           ],
                         ),
                       ),
                       Expanded(
                         child: Row(
                           children: <Widget>[
                             Expanded(
                               child: TextField(
                                 controller: m2,
                                 decoration: InputDecoration(
                                     hintText: 'math 2 marks',
                                     border: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(20))),
                               ),
                             ),
                             Expanded(
                               child: TextField(
                                 controller: m3,
                                 decoration: InputDecoration(                         
                                     hintText: 'math  marks',
                                     border: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(20))),
                               ),
                             ),
                           ],
                         ),
                       ),
                       Expanded(
                         child: Text(add.toString()),
                       ),
                       Expanded(
                         child: Text(per.toString()),
                       ),
                       Expanded(
                         child: Text(gr.toString()),
                       ),
                       Expanded(
                         child: Container(
                           color: bg,                  
                           margin: EdgeInsets.all(3),                 
                           
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
             );
           }
         
           void op() {
              print(roll.text);
          setState(() {
            a = int.parse(m1.text);
            b = int.parse(m2.text);
            c = int.parse(m3.text);
            add = a + b + c;
            per = add/3;
            print(per);
          });
          setState(() {
            if (per > 70) {
              bg = Colors.green;
            } else if (per > 60) {
              bg = Colors.lightGreen;
            } else if (per > 40) {
              bg = Colors.redAccent;
            } else {
              bg = Colors.white30;
            }
          });
          setState(() {
            if (per > 70) {
              gr = 'A';
              print(gr);
            } else if (per > 60) {
              gr = 'B';
              print(gr);
            } else if (per > 40) {
              gr = 'C';
              print(gr);
            } else {
              gr = 'F';
              print(gr);
            }
          });
           }
}
