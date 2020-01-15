class Bikeinfo{
  int id;
  String name;
  String bikenumber;
  String model;
  

  Bikeinfo(
    {
    this.id,this.name,this.bikenumber,this.model
    }
  );

  Bikeinfo.fromMap(Map<String,dynamic>map){
    id = map[id];
    name = map[name];
    bikenumber = map[bikenumber];
    model = map[model];
  }

  Map<String,dynamic>toMap(){
    return{
      'id':id,
      'name':name,
      'bikenumber':bikenumber,
      'model':model,
    };
  }
}