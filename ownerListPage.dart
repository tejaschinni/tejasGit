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
  FirebaseUser user;
  String userEmail;
  OwnerData ownerData;
  List<OwnerData> ownerList = new List();
  List<String> ownerRefList = new List();

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cFireBaseAuth.currentUser().then((user) => setState(() {
          this.user = user;
          userEmail = user.email;
        }));
    getData();
    // ownerList = widget.record.owner;
    // owner = widget.record.owner[0];
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    widget.loadRecordItems();
    getData();
    _refreshController.refreshCompleted();
    print('onrefresh');
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    widget.loadRecordItems();
    getData();
    _refreshController.loadComplete();
    print('on Load');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.fireBaseUser.email.toString()),
          actions: [
            IconButton(
                icon: Icon(Icons.list),
                onPressed: () {
                  print('owner list in listPage' + ownerList.toString());
                  print('owner Ref in listPage' + ownerRefList.toString());
                  print(ownerData.reference.documentID);
                  ownerRefList.add(ownerData.reference.documentID);
                  print('owner Ref in listPage Affter add' +
                      ownerRefList.toString());
                })
          ],
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
                            handleSignOut: widget.handleSignOut,
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
            child: ListView.builder(
                itemCount: ownerList.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: InkWell(
                      onLongPress: () {
                        delete(ownerList[index].reference.documentID.toString(),
                            index);
                      },
                      child: Container(
                        child: ListTile(
                          title: Text(ownerList[index].name),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewOwnerPage(
                                          record: widget.record,
                                          delete: delete,
                                          ownerlist: ownerList[index],
                                          index: index,
                                          handleSignOut: widget.handleSignOut,
                                        )));
                          },
                        ),
                      ),
                    ),
                  );
                }),
            controller: _refreshController,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
          ),
        )));
  }

  void putRef(String refDoc) {
    setState(() {
      ownerRefList.add(refDoc);
    });
  }

  getData() async {
    widget.loadRecordItems();
    setState(() {
      ownerList.clear();
      ownerRefList.clear();
    });
    print('_________________________');
    for (int i = 0; i < widget.record.ownerRef.length; i++) {
      setState(() {
        ownerRefList.add(widget.record.ownerRef[i].toString());

        Firestore.instance
            .collection('maintain')
            .document(widget.fireBaseUser.email.toString())
            .collection('owner')
            .document(widget.record.ownerRef[i].toString())
            .get()
            .then((DocumentSnapshot ds) {
          print(ds.documentID);
          setState(() {
            ownerData = OwnerData.fromSnapshot(ds);
            ownerList.add(ownerData);
          });
        });
      });
    }
    print('_________________________________________' +
        ownerList.length.toString());
    print('------------------------------' + ownerRefList.toString());
    print('----------------------refersing');
  }

  void delete(String docRef, int index) async {
    await Firestore.instance
        .collection('maintain')
        .document(widget.fireBaseUser.email.toString())
        .collection('owner')
        .document(ownerList[index].reference.documentID.toString())
        .delete()
        .catchError((onError) {
      print('------------------------------------------' + onError);
    });

    setState(() {
      ownerList.removeAt(index);
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
