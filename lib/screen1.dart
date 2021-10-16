import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(28, 13, 46, 1),
        body: Center(
          child: Stack(children: [
            Positioned(
                bottom: 20,
                right: -80,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('Assets/bg bloop.png'),
                )),
            Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: ListTile(
                          leading: Container(
                            height: 20,
                            width: 20,
                            child: Image.asset('Assets/Group 356.png'),
                          ),
                          title: TextField(),
                        ),
                      ),
                    )),
                Expanded(flex: 10, child: Container())
              ],
            ),
          ]),
        ));
  }
}
