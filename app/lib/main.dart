import 'package:flutter/material.dart';
main()=>runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color one, two, three, four, five, six, seven,eight, nine;
  bool flag=false;
 
String winner='';
String title = 'Tic Tac  Toe';
  
  @override

  
  void initState() { 
    super.initState();
    refresh();
  }
@override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.orange,
                child: Center(
            
                  child: Text(title,style: TextStyle(
                    fontSize: 40,fontWeight:FontWeight.bold,
                    fontStyle: FontStyle.italic,
                
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
                    color: Colors.blue,
                    width: 6,
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
                    color: Colors.blue,
                    width: 6,
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
                    color: Colors.blue,
                    width: 6,
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
                    color: Colors.blue,
                    width: 6,
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
                    color: Colors.blue,
                    width: 6,
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
                    color: Colors.blue,
                    width: 6,
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
                    color: Colors.blue,
                    width: 6,
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
                    color: Colors.blue,
                    width: 6,
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
                    color: Colors.blue,
                    width: 6,
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
      winner='';
      title = 'Tic Tac  Toe';
      
    });

  }
  void check(){

    if(winner=='')
  {
    if(one==Colors.brown && five==Colors.brown && nine==Colors.brown)
    {
      setState(() {
        winner = 'brown';
        title='brown';
      });
       print('chicken dinner159');
    }
    else if(one==Colors.red && five==Colors.red && nine==Colors.red)
    {
      setState(() {
        winner='red';
        title='red';
      });
       print('chicken dinner159');
    }
    else if(three==Colors.brown && five==Colors.brown && seven==Colors.brown)
    {
      setState(() {
        winner='brown';
        title='brown';
      });
       print('chicken dinner357');
    }
    else if(three==Colors.red && five==Colors.red && seven==Colors.red)
    {
      setState(() {
        winner='red';
          title='red';
      });
       print('chicken dinner357');
    }
    else if(one==Colors.brown && four==Colors.brown && seven==Colors.brown)
    {
      setState(() {
        winner='brown';
        title='brown';
      });
       print('chicken dinner147');
    }
    else if(one==Colors.red && four==Colors.red && seven==Colors.red)
    {
      setState(() {
        winner='red';
          title='red';
      });
       print('chicken dinner147');
    }
    else if(two==Colors.brown && five==Colors.brown && eight==Colors.brown)
    {
      setState(() {
        winner='brown';
        title='brown';
      });
       print('chicken dinner258');
    }
    else if(two==Colors.red && five==Colors.red && eight==Colors.red)
    {

      setState(() {
        winner='red';
          title='red';
      });
       print('chicken dinner258');
    }

    else if(three==Colors.brown && six==Colors.brown && nine==Colors.brown)
    {
      setState(() {
        winner='brown';
        title='brown';
      });
       print('chicken dinner369');
    }
    else if(three==Colors.red && six==Colors.red && nine==Colors.red)
    {
      setState(() {
        winner='red';
          title='red';
      });
       print('chicken dinner369');
    }

    else if(one==Colors.brown && two==Colors.brown && three==Colors.brown)
    {
      setState(() {
        winner='brown';
        title='brown';
      });
       print('chicken dinner123');
    }
    else if(one==Colors.red && two==Colors.red && three==Colors.red)
    {
      setState(() {
        winner='red';
          title='red';
      });
       print('chicken dinner123');
    }

    else if(four==Colors.brown && five==Colors.brown && six==Colors.brown)
    {
      setState(() {
        winner='brown';
        title='brown';
      });
       print('chicken dinner456');
    }
    else if(four==Colors.red && five==Colors.red && six==Colors.red)
    {
      setState(() {
        winner='red';
          title='red';
      });
       print('chicken dinner456');
    }

    else if(seven==Colors.brown && eight==Colors.brown && nine==Colors.brown)
    {
      setState(() {
        winner='brown';
        title='brown';
      });
       print('chicken dinner789');
    }
    else if(seven==Colors.red && eight==Colors.red && nine==Colors.red)
    {
      setState(() {
        winner='red';
          title='red';
      });
       print('chicken dinner789');
    }
    print('.');
  }
  }  
  
}