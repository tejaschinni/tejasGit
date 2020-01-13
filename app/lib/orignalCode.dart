import 'package:flutter/material.dart';
main()=>runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color one, two, three, four, five, six, seven,eight, nine;
  bool flag=false;
  @override

  
  void initState() { 
    super.initState();
    refresh();
  }
@override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.orange,
                child: Center(
                  child: Text('Tik Tok Toe',style: TextStyle(
                    fontSize: 40,
                  ),),
                ),
              ),
            ),
            Expanded(flex: 5,
              child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
          children: <Widget>[
            Expanded(
              child:InkWell(
                onTap: (){
                  setState(() {
                    if(one==Colors.white)
                    {
                    one=flag?Colors.red:Colors.brown;
                    flag=!flag;
                    check();
                    }
                  });
                },
              
              child: Container(
                decoration: BoxDecoration(
                  color:one,
                  border: Border.all(
                    color: Colors.pink,
                  )
                ),
              ),
              ),
            ),
             Expanded(
              child:InkWell(
                onTap: (){
                  setState(() {
                    if(two==Colors.white)
                    {
                      two=flag?Colors.red:Colors.brown;
                    flag=!flag;
                     check();
                    }
                  });
                },
              
              child: Container(
                decoration: BoxDecoration(
                  color:two,
                  border: Border.all(
                    color: Colors.pink,
                  )
                ),
              ),
              ),
            ),
             Expanded(
              child:InkWell(
                onTap: (){
                  setState(() {
                    if(three==Colors.white)
                    {
                      three=flag?Colors.red:Colors.brown;
                    flag=!flag;
                     check();
                    }
                  });
                },
              
              child: Container(
                decoration: BoxDecoration(
                  color:three,
                  border: Border.all(
                    color: Colors.pink,
                  )
                ),
              ),
              ),
            ),
          ],
        ),
            ),
            Expanded(
              child: Row(
          children: <Widget>[
             Expanded(
              child:InkWell(
                onTap: (){
                  setState(() {
                   if(four==Colors.white)
                    {
                      four=flag?Colors.red:Colors.brown;
                    flag=!flag;
                     check();
                    }
                  });
                },
              
              child: Container(
                decoration: BoxDecoration(
                  color:four,
                  border: Border.all(
                    color: Colors.pink,
                  )
                ),
              ),
              ),
            ),
            Expanded(
              child:InkWell(
                onTap: (){
                  setState(() {
                   if(five==Colors.white)
                    {
                      five=flag?Colors.red:Colors.brown;
                    flag=!flag;
                     check();
                    }
                  });
                },
              
              child: Container(
                decoration: BoxDecoration(
                  color:five,
                  border: Border.all(
                    color: Colors.pink,
                  )
                ),
              ),
              ),
            ),
            Expanded(
              child:InkWell(
                onTap: (){
                  setState(() {
                   if(six==Colors.white)
                    {
                      six=flag?Colors.red:Colors.brown;
                    flag=!flag;
                     check();
                    }
                  });
                },
              
              child: Container(
                decoration: BoxDecoration(
                  color:six,
                  border: Border.all(
                    color: Colors.pink,
                  )
                ),
              ),
              ),
            ),
          ],
        ),
            ),
            Expanded(
              child: Row(
          children: <Widget>[
             Expanded(
              child:InkWell(
                onTap: (){
                  setState(() {
                   if(seven==Colors.white)
                    {
                      seven=flag?Colors.red:Colors.brown;
                    flag=!flag;
                     check();
                    }
                  });
                },
              
              child: Container(
                decoration: BoxDecoration(
                  color:seven,
                  border: Border.all(
                    color: Colors.pink,
                  )
                ),
              ),
              ),
            ),
             Expanded(
              child:InkWell(
                onTap: (){
                  setState(() {
                   if(eight==Colors.white)
                    {
                      eight=flag?Colors.red:Colors.brown;
                    flag=!flag;
                     check();
                    }
                  });
                },
              
              child: Container(
                decoration: BoxDecoration(
                  color:eight,
                  border: Border.all(
                    color: Colors.pink,
                  )
                ),
              ),
              ),
            ),
             Expanded(
              child:InkWell(
                onTap: (){
                  setState(() {
                   if(nine==Colors.white)
                    {
                      nine=flag?Colors.red:Colors.brown;
                    flag=!flag;
                     check();
                    }
                  });
                },
              
              child: Container(
                decoration: BoxDecoration(
                  color:nine,
                  border: Border.all(
                    color: Colors.pink,
                  )
                ),
              ),
              ),
            ),
          ],
        ),
            ),
          ],
        ),
            ),
            Expanded(
              child: Container(
                color:Colors.green,
                child: Center(
                  child: RaisedButton(
                    child: Text('refresh'),
                    onPressed: (){
                      refresh();
                    },

                  ),
                ),
              ),
            ),
          ],
        ),
      ),  
    );
  }
  refresh(){
    setState(() {
      one=Colors.white;
      two=Colors.white;
      three=Colors.white;
      four=Colors.white;
      five=Colors.white;
      six=Colors.white;
      seven=Colors.white;
      eight=Colors.white;
      nine=Colors.white;
    });

  }
  void check(){

    if(one==Colors.brown && five==Colors.brown && nine==Colors.brown)
    {
       print('chicken dinner');
    }
    else if(one==Colors.orange && five==Colors.orange && nine==Colors.orange)
    {
       print('chicken dinner');
    }
    else if(three==Colors.brown && five==Colors.brown && seven==Colors.brown)
    {
       print('chicken dinner');
    }
    else if(three==Colors.orange && five==Colors.orange && seven==Colors.orange)
    {
       print('chicken dinner');
    }
    else if(one==Colors.brown && four==Colors.brown && seven==Colors.brown)
    {
       print('chicken dinner');
    }
    else if(one==Colors.orange && four==Colors.orange && seven==Colors.orange)
    {
       print('chicken dinner');
    }
    else if(two==Colors.brown && five==Colors.brown && eight==Colors.brown)
    {
       print('chicken dinner');
    }
    else if(two==Colors.orange && five==Colors.orange && eight==Colors.orange)
    {
       print('chicken dinner');
    }

    else if(three==Colors.brown && six==Colors.brown && nine==Colors.brown)
    {
       print('chicken dinner');
    }
    else if(three==Colors.orange && six==Colors.orange && nine==Colors.orange)
    {
       print('chicken dinner');
    }

    else if(one==Colors.brown && two==Colors.brown && three==Colors.brown)
    {
       print('chicken dinner');
    }
    else if(one==Colors.orange && two==Colors.orange && three==Colors.orange)
    {
       print('chicken dinner');
    }

    else if(four==Colors.brown && five==Colors.brown && six==Colors.brown)
    {
       print('chicken dinner');
    }
    else if(four==Colors.orange && five==Colors.orange && six==Colors.orange)
    {
       print('chicken dinner');
    }

    else if(seven==Colors.brown && eight==Colors.brown && nine==Colors.brown)
    {
       print('chicken dinner');
    }
    else if(seven==Colors.orange && eight==Colors.orange && nine==Colors.orange)
    {
       print('chicken dinner');
    }
    print('.');
  }
  
}