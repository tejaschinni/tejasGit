import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JsonDemo extends StatefulWidget {
  @override
  _JsonDemoState createState() => _JsonDemoState();
}

class _JsonDemoState extends State<JsonDemo> {
  List<Fact> flist = List();
  String json = '[\n';
  List jsonList;

  @override
  @override
  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    String link = "http://numbersapi.com/";

    for (var i = 0; i < 20; i++) {
      final response = await http.get(link + "" + i.toString());

      setState(() {
        flist.add(Fact(num: i, info: response.body.toString()));
      });
      print(i);
    }

    setState(() {
      jsonList = Fact.encondeToJson(flist);
    });

    print("numFact: ${jsonList}");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
          child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: flist.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
                color: Colors.redAccent
              ),
              child: ListTile(
                title: Text(flist[index].info),

              ),
            );
          },
        ),
      )),
    );
  }
}

class Fact {
  final int num;
  final String info;

  Fact({this.num, this.info});
  Map<String, dynamic> toJson() {
    return {
      "num": this.num,
      "info": this.info,
    };
  }

  static List encondeToJson(List<Fact> flist) {
    List jsonlist = List();
    flist.map((item) => jsonlist.add(item.toJson())).toString();
    return jsonlist;
  }
}
