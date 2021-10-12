import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hivedemo/data/dog.dart';
import 'package:hivedemo/hiveDemoPage.dart';

class ViewHiveDemo extends StatefulWidget {
  const ViewHiveDemo({Key? key}) : super(key: key);

  @override
  _ViewHiveDemoState createState() => _ViewHiveDemoState();
}

class _ViewHiveDemoState extends State<ViewHiveDemo> {
  var box;
  List<Dog> dog = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initHive();
  }

  initHive() async {
    box = await Hive.openBox('myBox');
    getEnquery();
  }

  getEnquery() async {
    dog.clear();
    for (int i = 0; i < box.length; i++) {
      setState(() {
        dog.add(box.getAt(i));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(() => HiveDemoPage());
        },
      ),
      appBar: AppBar(
        title: Text('Hive View Data'),
      ),
      body: Container(
        child: dog.length > 0
            ? Container(
                child: ListView.builder(
                    itemCount: dog.length,
                    itemBuilder: (contex, index) {
                      return ListTile(
                        leading: Text(dog[index].id.toString()),
                        title: Text(dog[index].name),
                        trailing: Text(dog[index].age.toString()),
                      );
                    }),
              )
            : Container(),
      ),
    );
  }
}
