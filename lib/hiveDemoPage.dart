import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hivedemo/data/dog.dart';

class HiveDemoPage extends StatefulWidget {
  const HiveDemoPage({Key? key}) : super(key: key);

  @override
  _HiveDemoPageState createState() => _HiveDemoPageState();
}

class _HiveDemoPageState extends State<HiveDemoPage> {
  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();

  var box;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initHive();
  }

  initHive() async {
    box = await Hive.openBox('myBox');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive Demo'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.list))],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  controller: id,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'id',
                      hintText: '12',
                      prefixIcon: Icon(Icons.favorite)),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'name',
                      hintText: 'moti',
                      prefixIcon: Icon(Icons.text_fields)),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  controller: age,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'age',
                      hintText: '12',
                      fillColor: Colors.blue.shade500,
                      prefixIcon: Icon(Icons.timelapse)),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          addDog();
        },
      ),
    );
  }

  addDog() async {
    if (int.parse(id.text) > 0 &&
        int.parse(age.text) > 0 &&
        name.text.length > 2) {
      setState(() {
        Dog g = new Dog(
            id: int.parse(id.text), name: name.text, age: int.parse(age.text));
        box.add(g);
      });
      setState(() {
        id.text = ' ';
        name.text = ' ';
        age.text = ' ';
      });
      print('Added done');

      Get.snackbar('success', 'Dog added Successfully');
    } else {
      print('object');
    }
  }
}
