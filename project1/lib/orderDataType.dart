class OrderDataType {
  int id;
  String name;
  int price;

  OrderDataType({this.id,this.name,this.price});

  OrderDataType.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    price = map['price'];
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }
}
