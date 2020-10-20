import 'package:flutter/material.dart';

class ReceiptPage extends StatefulWidget {
  @override
  _ReceiptPageState createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  int _value = 1;
  String finalDate = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentDate();
  }

  getCurrentDate() {
    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

    setState(() {
      finalDate = formattedDate.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipte fo maintance'),
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.save), onPressed: () {}),
      body: Center(
        child: Column(
          children: [
            Container(
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'maintaince_amount',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'paid_amount ',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Balance amount',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            DropdownButton(
                value: _value,
                items: [
                  DropdownMenuItem(
                    child: Text('paid_by_Cash'),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text(' paid_by_Check'),
                    value: 2,
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                }),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
