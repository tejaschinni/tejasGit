import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newapp1/doglists.dart';
import 'package:newapp1/newdemo/edit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../dog.dart';

class Listed extends StatefulWidget {
  final List<Dog> doglist;
  final Function deleteDog;
  final  Function upgradeDog;
  final  Function dogs;
  Listed(this.doglist,this.deleteDog,this.upgradeDog,this.dogs);

  
  @override
  _ListedState createState() => _ListedState();
}

class _ListedState extends State<Listed> {

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
       widget.dogs();
       print('cfdsfcdsfc_______________');
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    //items.add((items.length+1).toString());
    if(mounted)
    setState(() {

    });
    _refreshController.loadComplete();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dog List"),
      ),
      body: SafeArea(
        child: Center(
          child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context,LoadStatus mode){
            Widget body ;
            if(mode==LoadStatus.idle){
              body =  Text("pull up load");
            }
            else if(mode==LoadStatus.loading){
              body =  CupertinoActivityIndicator();
            }
            else if(mode == LoadStatus.failed){
              body = Text("Load Failed!Click retry!");
            }
            else if(mode == LoadStatus.canLoading){
                body = Text("release to load more");
            }
            else{
              body = Text("No more Data");
            }
            return Container(
              height: 55.0,
              child: Center(child:body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
            itemCount: widget.doglist.length,
            itemBuilder: (context,index){
              return Container(
                color: Colors.grey,
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Row(
                    children: <Widget>[
                       Text(widget.doglist[index].name),
                       SizedBox(width: 10,) ,
                       Text(widget.doglist[index].weight.toString()),  
                       SizedBox(width: 20,),
                       InkWell(
                         child: Icon(Icons.edit),
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=> Edited(widget.doglist[index],widget.upgradeDog)));
                         },
                       ),
                       SizedBox(width: 20,),
                       InkWell(
                         child: Icon(Icons.delete),
                         onTap: (){
                          setState(() {
                             widget.doglist.removeAt(index);
                          });
                           widget.deleteDog(widget.doglist[index].id);
                         },
                       )          
                    
                    ],
                  ),
                  trailing: Text(widget.doglist[index].age.toString()),
                ),
              );
            },
          ),
      ),
        ),
      ),
    );
  }
}




