import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project1/litemDataType.dart';

class JsonDemo2Itmes extends StatefulWidget {
  @override
  _JsonDemo2ItmesState createState() => _JsonDemo2ItmesState();
}

class _JsonDemo2ItmesState extends State<JsonDemo2Itmes> {
// A function that converts a response body into a List<Photo>.
  List<Items> parseItems(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Items>((json) => Items.fromJson(json)).toList();
  }

  Future<List<Items>> fetchItems(http.Client client) async {
    final response = await client.get(
        'https://raw.githubusercontent.com/chetan2469/git/master/grocery_market/grocery.json');

    return parseItems(response.body);
  }

//   List<Items> parseItem(String responseBody) {
//   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

//   return parsed.map<Items>((json) => Items.fromJson(json)).toList();
// }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json Demo'),
      ),
      body: FutureBuilder<List<Items>>(
        future: fetchItems(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PhotosList(item: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<Items> item;

  PhotosList({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: item.length,
      itemBuilder: (contex,index){
        return ListTile(
          title: Text(item[index].itemEnglishName),
        );
    });
  }
}
