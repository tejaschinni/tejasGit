class Dog {
  int id;
  int age;
  String name;

  Dog({this.id, this.age, this.name});

   Dog.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    age = map['age'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }
}
