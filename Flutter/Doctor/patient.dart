class Patient
{
  int id;
  int age;
  String name;
  String address;
  String mob;
  String decease;
  String medic;


  Patient(
    {
      this.id,this.name,this.age,this.address,this.mob,this.decease,this.medic
    }
  );

  Patient.fromMap(Map<String,dynamic>map){
    id = map[id];
    name = map[name];
    age = map[age];
    address = map[address];
    mob = map[mob];
    decease = map[decease];
    medic = map[medic];
  }

  Map<String,dynamic>toMap(){
    return{
       'id':id,
       'name':name,
       'age':age,
       'address':address,
       'mob':mob,
       'decease':decease,
       'medic':medic,
    };
  }
}