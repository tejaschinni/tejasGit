import 'package:flutter/material.dart';

class MenuDemo extends StatefulWidget {
  @override
  _MenuDemoState createState() => _MenuDemoState();
}

class _MenuDemoState extends State<MenuDemo> {

  final String _simpleValue1 = 'Menu item value one';
  final String _simpleValue2 = 'Menu item value two';
  final String _simpleValue3 = 'Menu item value three';
  String _simpleValue;

  void showMenuSelection(String value) {
    if (<String>[_simpleValue1, _simpleValue2, _simpleValue3].contains(value))
      _simpleValue = value;
   // showInSnackBar('You selected: $value');
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _simpleValue = _simpleValue2;
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),      
      body: Container(
        child: ListTile(
            title: const Text('An item with a sectioned menu'),
            trailing: PopupMenuButton<String>(
              padding: EdgeInsets.zero,
              onSelected: showMenuSelection,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Preview',
                  child: ListTile(
                    leading: Icon(Icons.visibility),
                    title: Text('Preview'),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Share',
                  child: ListTile(
                    leading: Icon(Icons.person_add),
                    title: Text('Share'),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Get Link',
                  child: ListTile(
                    leading: Icon(Icons.link),
                    title: Text('Get link'),
                  ),
                ),
                const PopupMenuDivider(),
                const PopupMenuItem<String>(
                  value: 'Remove',
                  child: ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Remove'),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}