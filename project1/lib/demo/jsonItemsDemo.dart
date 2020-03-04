
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project1/litemDataType.dart';

class JsonExample1 extends StatefulWidget {
  @override
  _JsonExample1State createState() => _JsonExample1State();
}

class _JsonExample1State extends State<JsonExample1> {
//   List<Items> parseItems(String responseBody){
//     final parsed = json.decode(responseBody).cast<Map<String,dynamic>>();

//     return parsed.map<Items>((json)=>Items.fromJson(json)).toList();
//   }
  
//   Future<List<Items>> fetchPhotos(http.Client client) async {
//   final response =
//       await client.get('https://jsonplaceholder.typicode.com/photos');

//   return parseItems(response.body);
// }




  String json = '[\n';
  List jsonList;

  @override
  @override
  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    String link = "https://raw.githubusercontent.com/chetan2469/git/master/grocery_market/grocery.json";

    
      final response = await http.get(link );

      // setState(() {
      //   flist.add(Items(itemEnglishName: response.body.toString()));
      // });

    // setState(() {
    //   jsonList = Items.encondeToJson(flist);
    // });

    print("numItems: ${jsonList}");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
          child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          //itemCount: flist.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
                color: Colors.redAccent
              ),
              child: ListTile(
                title: Text('flist[index].itemEnglishName'),

              ),
            );
          },
        ),
      )),
    );
  }
}


