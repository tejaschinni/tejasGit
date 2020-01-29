import 'package:flutter/material.dart';
import 'package:project1/orderDataType.dart';
import 'package:project1/orderPage.dart';

class OrderViewPage extends StatefulWidget {
  final OrderDataType orderDataType;
  OrderViewPage({this.orderDataType});
  @override
  _OrderViewPageState createState() => _OrderViewPageState();
}

class _OrderViewPageState extends State<OrderViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Customer Order Details'),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ClipPath(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/order.jpg',
                        ),
                        fit: BoxFit.fill)),
              ),
              clipper: BottomWaveClipper(),
            ),
            Container(
              padding: EdgeInsets.only(top: 170),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: ListView.builder(
                padding: EdgeInsets.only(top: 140),
                itemCount: widget.orderDataType.id,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Text(widget.orderDataType.name),
                      SizedBox(
                        height: 10,
                      ),
                      Text(widget.orderDataType.product),
                      SizedBox(
                        height: 10,
                      ),
                      Text(widget.orderDataType.quantity.toString()),
                      SizedBox(
                        height: 10,
                      ),
                      Text(widget.orderDataType.price.toString()),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 110);
    path.lineTo(
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
