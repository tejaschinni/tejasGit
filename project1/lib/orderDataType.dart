class OrderDataType {
  int id;
  String name;
  int price;
  String product;
  int quantity;

  OrderDataType({this.id,this.name,this.price,this.quantity,this.product});

  OrderDataType.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    price = map['price'];
    product = map['product'];
    quantity = map['quantity'];
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'product':product,
      'quantity':quantity,
    };
  }
}
