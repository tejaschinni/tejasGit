import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:newapp1/calculator/dataPickerDemo.dart';

class NumberTrivaDemo extends StatefulWidget {
  @override
  _NumberTrivaDemoState createState() => _NumberTrivaDemoState();
}

class _NumberTrivaDemoState extends State<NumberTrivaDemo> {
  TextEditingController numberController = TextEditingController();
  PageController pageController = PageController(initialPage: 2019);
  String url = 'http://numbersapi.com/0';
  Random r = Random();
  String d;
  String a = ' ';
  DateTime selectedDate;
  int displayedYear;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedDate = DateTime(2019, 7);
    displayedYear = selectedDate.year;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Number"),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                    child: FutureBuilder(
                  future: url != null
                      ? http.get(url).then((response) => response.body)
                      : null,
                  builder:
                      (BuildContext contex, AsyncSnapshot<String> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Text("Input A url to start");
                      case ConnectionState.waiting:
                        return new Center(
                          child: CircularProgressIndicator(),
                        );
                      case ConnectionState.active:
                        return new Text("Active");
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          return new Text(
                            '${snapshot.error}',
                            style: TextStyle(color: Colors.red),
                          );
                        } else {
                          return Column(
                            children: <Widget>[
                              SizedBox(
                                height: 100,
                              ),
                              Container(
                                child: Text(snapshot.data),
                                
                                ),
                              Container(
                                  child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 100,
                                  ),
                                ],
                              )),
                            ],
                          );
                        }
                    }
                  },
                )),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: TextField(
                        enabled: false,
                        controller: numberController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          )
                        ),
                      ),
                    ),
                    RaisedButton(
                      child: Text("Date"),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DatePickerDemo()));
                        setState(() {
                          
                          url = 'http://numbersapi.com/'+selectedDate.toString();
                        });
                        print(selectedDate);
                      },
                    )
                  ],
                ),
              ),
              
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          numberController.text = numberController.text + "1";
                          url = 'http://numbersapi.com/' + numberController.text;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("1"),
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                           numberController.text = numberController.text + "2";
                           url = 'http://numbersapi.com/' + numberController.text;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("2"),
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                           numberController.text = numberController.text + "3";
                           url = 'http://numbersapi.com/' + numberController.text;
                        });
                      },
                      child: Container(
                        
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("3"),
                      ),
                    )),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                           numberController.text = numberController.text + "4";
                           url = 'http://numbersapi.com/' + numberController.text;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("4"),
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                           numberController.text = numberController.text + "5";
                           url = 'http://numbersapi.com/' + numberController.text;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("5"),
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                           numberController.text = numberController.text + "6";
                           url = 'http://numbersapi.com/' + numberController.text;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("6"),
                      ),
                    )),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          numberController.text = numberController.text + "7";
                          url = 'http://numbersapi.com/' + numberController.text;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("7"),
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          numberController.text = numberController.text + "8";
                          url = 'http://numbersapi.com/' + numberController.text;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("8"),
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          numberController.text = numberController.text + "9";
                          url = 'http://numbersapi.com/' + numberController.text;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("9"),
                      ),
                    )),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          d = r.nextInt(1000).toString();
                          url = 'http://numbersapi.com/' + d;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("Random"),
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                           numberController.text = numberController.text + "0";
                           url = 'http://numbersapi.com/' + numberController.text;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("0"),
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          numberController.text = '';
                          url = 'http://numbersapi.com/0';
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5),
                        child: Text("AC"),
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  yearMonthPicker() => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Builder(builder: (context) {
            if (MediaQuery.of(context).orientation == Orientation.portrait) {
              return IntrinsicWidth(
                child: Column(children: [
                  buildHeader(),
                  Material(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [buildPager()],
                    ),
                  )
                ]),
              );
            }
            return IntrinsicHeight(
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildHeader(),
                    Material(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [buildPager()],
                      ),
                    )
                  ]),
            );
          }),
        ],
      );
  buildHeader() {
    return Material(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${DateFormat.yMMM().format(selectedDate)}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('${DateFormat.y().format(DateTime(displayedYear))}',
                    style: TextStyle(color: Colors.white)),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.keyboard_arrow_up, color: Colors.white),
                      onPressed: () => pageController.animateToPage(
                          displayedYear - 1,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeInOut),
                    ),
                    IconButton(
                      icon:
                          Icon(Icons.keyboard_arrow_down, color: Colors.white),
                      onPressed: () => pageController.animateToPage(
                          displayedYear + 1,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeInOut),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildPager() => Container(
        color: Colors.white,
        height: 210.0,
        width: 500.0,
        child: Theme(
            data: Theme.of(context).copyWith(
                buttonTheme: ButtonThemeData(
                    padding: EdgeInsets.all(0.0),
                    shape: CircleBorder(),
                    minWidth: 1.0)),
            child: PageView.builder(
              controller: pageController,
              scrollDirection: Axis.vertical,
              onPageChanged: (index) {
                setState(() {
                  displayedYear = index;
                });
              },
              itemBuilder: (context, year) {
                return GridView.count(
                  padding: EdgeInsets.all(12.0),
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 5,
                  children: List<int>.generate(12, (i) => i + 1)
                      .map((month) => DateTime(year, month))
                      .map(
                        (date) => Padding(
                          padding: EdgeInsets.all(4.0),
                          child: FlatButton(
                            onPressed: () => setState(() {
                              selectedDate = DateTime(date.year, date.month);
                            }),
                            color: date.month == selectedDate.month &&
                                    date.year == selectedDate.year
                                ? Colors.orange
                                : null,
                            textColor: date.month == selectedDate.month &&
                                    date.year == selectedDate.year
                                ? Colors.white
                                : date.month == DateTime.now().month &&
                                        date.year == DateTime.now().year
                                    ? Colors.orange
                                    : null,
                            child: Text(
                              DateFormat.MMM().format(date),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            )),
      );
}
