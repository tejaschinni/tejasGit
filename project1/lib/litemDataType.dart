

class Items{
  final String itemEnglishName;
  final String itemsHindiName;
  final String itemsMarathiName;
  final String itemUnite;
  final double itemQuantity;
  final String itemsPrice;


  Items({this.itemEnglishName,this.itemsHindiName,this.itemsMarathiName,this.itemUnite,this.itemsPrice,this.itemQuantity});

  factory Items.fromJson(Map<String,dynamic>json){
    return Items(
      itemEnglishName: json['itemEnglishName'] as String,
      itemsHindiName: json['itemHindiName'] as String,
      itemsMarathiName: json['itemMarathiName'] as String,
      itemUnite: json['itemUnite'] as String,
      itemQuantity: json['itemQuantity'] as double,
      itemsPrice: json['itemsPrice'] as String,
    );
  }
}