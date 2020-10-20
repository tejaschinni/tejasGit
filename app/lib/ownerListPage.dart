import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/Data/AdminData.dart';
import 'package:my_app/Owner/ownerData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/Constant.dart';
import 'package:my_app/maintain/addOwnerPage.dart';
import 'package:my_app/maintain/viewOwnerPage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../Owner/ownerData.dart';

class OwnerListPage extends StatefulWidget {
  final Function handleSignOut, reloadRecord, loadRecordItems;
  final FirebaseUser fireBaseUser;
  final AdminData record;
  OwnerListPage(
      {this.fireBaseUser,
      this.handleSignOut,
      this.record,
      this.reloadRecord,
      this.loadRecordItems});
  @override
  _OwnerListPageState createState() => _OwnerListPageState();
}

class _OwnerListPageState extends State<OwnerListPage> {
  final Debouncer debouncer = Debouncer(50);
  FirebaseUser user;
  OwnerData ownerData;
  String searchStr = "";
  List<OwnerData> ownerList = new List();
  List<OwnerData> filterOwnerList = new List();
  List<String> ownerRefList = new List();

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onRefresh();
  }

  void onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    fetchData();
    _refreshController.refreshCompleted();
    print('onrefresh');
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()

    _refreshController.loadComplete();
    print('on Load');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddOwnerPage(
                            record: widget.record,
                            fireBaseUser: widget.fireBaseUser,
                            ownerRefList: ownerRefList,
                            ownerList: ownerList,
                            handleSignOut: onRefresh,
                          )));
            }),
        body: Center(
            child: Container(
          margin: EdgeInsets.all(10),
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header: WaterDropHeader(),
            footer: CustomFooter(
              builder: (BuildContext context, LoadStatus mode) {
                Widget body;
                if (mode == LoadStatus.idle) {
                  body = Text("pull up load");
                } else if (mode == LoadStatus.loading) {
                  body = CupertinoActivityIndicator();
                } else if (mode == LoadStatus.failed) {
                  body = Text("Load Failed!Click retry!");
                } else if (mode == LoadStatus.canLoading) {
                  body = Text("release to load more");
                } else {
                  body = Text("No more Data");
                }
                return Container(
                  height: 55.0,
                  child: Center(child: body),
                );
              },
            ),
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      child: TextField(
                        textCapitalization: TextCapitalization.sentences,
                        onChanged: (String searchKey) {
                          print(searchKey);
                          debouncer.run(() {
                            setState(() {
                              searchStr = searchKey;

                              filterOwnerList = ownerList
                                  .where((str) => (str.name
                                      .toLowerCase()
                                      .contains(searchKey.toLowerCase())))
                                  .toList();
                            });
                          });
                        },
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            fillColor: Colors.white38,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                            prefixIcon:
                                Icon(Icons.search, color: Colors.black54),
                            hintText: "Search text...",
                            hintStyle: TextStyle(color: Colors.black54)),
                      ),
                    )),
                Expanded(
                  flex: 9,
                  child: Container(
                    child: ListView.builder(
                        itemCount: filterOwnerList.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: InkWell(
                              onLongPress: () {
                                delete(
                                    filterOwnerList[index]
                                        .reference
                                        .documentID
                                        .toString(),
                                    index);
                              },
                              child: Container(
                                child: ListTile(
                                  title: Text(filterOwnerList[index].name),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ViewOwnerPage(
                                                  fireBaseUser:
                                                      widget.fireBaseUser,
                                                  record: widget.record,
                                                  delete: delete,
                                                  ownerData:
                                                      filterOwnerList[index],
                                                  index: index,
                                                  handleSignOut:
                                                      widget.handleSignOut,
                                                )));
                                  },
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
            controller: _refreshController,
            onRefresh: onRefresh,
            onLoading: _onLoading,
          ),
        )));
  }

  // void putRef(String refDoc) {
  //   setState(() {
  //     ownerRefList.add(refDoc);
  //   });
  // }

  fetchData() async {
    setState(() {
      ownerList.clear();
      ownerRefList.clear();
    });
    final QuerySnapshot result = await Firestore.instance
        .collection('maintain')
        .document(widget.fireBaseUser.email)
        .collection('owner')
        .getDocuments();

    final List<DocumentSnapshot> documents = result.documents;

    documents.forEach((data) {
      final ownerRecord = OwnerData.fromSnapshot(data);
      setState(() {
        ownerList.add(ownerRecord);
        filterOwnerList.add(ownerRecord);
        ownerRefList.add(ownerRecord.reference.documentID.toString());
      });

      print('--------------------------------fetch Data fuction was called');
    });
    filterOwnerList.sort((a, b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
  }

  // getData() async {
  //   widget.loadRecordItems();
  //   setState(() {
  //     ownerList.clear();
  //     ownerRefList.clear();
  //   });
  //   print('_________________________');
  //   for (int i = 0; i < widget.record.ownerRef.length; i++) {
  //     setState(() {
  //       ownerRefList.add(widget.record.ownerRef[i].toString());

  //       Firestore.instance
  //           .collection('maintain')
  //           .document(widget.fireBaseUser.email.toString())
  //           .collection('owner')
  //           .document(widget.record.ownerRef[i].toString())
  //           .get()
  //           .then((DocumentSnapshot ds) {
  //         print(ds.documentID);
  //         setState(() {
  //           ownerData = OwnerData.fromSnapshot(ds);
  //           ownerList.add(ownerData);
  //         });
  //       });
  //     });
  //   }
  //   print('_________________________________________' +
  //       ownerList.length.toString());
  //   print('------------------------------' + ownerRefList.toString());
  //   print('----------------------refersing');
  // }

  void delete(String docRef, int index) async {
    await Firestore.instance
        .collection('maintain')
        .document(widget.fireBaseUser.email.toString())
        .collection('owner')
        .document(filterOwnerList[index].reference.documentID.toString())
        .delete()
        .catchError((onError) {
      print('------------------------------------------' + onError);
    });

    setState(() {
      ownerList.removeAt(index);
      filterOwnerList.removeAt(index);
      ownerRefList.removeAt(index);
      if (ownerRefList.length == 0) {
        ownerRefList.clear();
      }
    });

    await Firestore.instance
        .collection('maintain')
        .document(widget.fireBaseUser.email)
        .updateData({
      'ownerRef': ownerRefList,
    });
    print(ownerRefList.length);
    print(ownerList.length);
  }
}

class Debouncer {
  final int milliSeconds;
  VoidCallback action;
  Timer _timer;

  Debouncer(this.milliSeconds);

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliSeconds), action);
  }
}
