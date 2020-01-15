class Dog
{
  int id;
  int age;
  int weight;
  String name;

  Dog({
    this.id,this.name,this.age,this.weight
  });

  Dog.fromMap(Map<String,dynamic>map){
    id = map[id];
    name = map[name];
    age = map[age];
    weight = map[weight];
  }

  Map<String,dynamic>toMap(){
    return{
      'id':id,
      'name':name,
      'age':age,
      'weight':weight
    };
  }
}

