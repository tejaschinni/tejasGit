

class Items{
  final String itemEnglishName;
  final String itemHindiName;
  final String itemMarathiName;
  final String itemUnite;
  final double itemQuantity;
  final String itemPrice;


  Items({this.itemEnglishName,this.itemHindiName,this.itemMarathiName,this.itemUnite,this.itemPrice,this.itemQuantity});

  factory Items.fromJson(Map<String,dynamic>json){
    return Items(
      itemEnglishName: json['itemEnglishName'] as String,
      itemHindiName: json['itemHindiName'] as String,
      itemMarathiName: json['itemMarathiName'] as String,
      itemUnite: json['itemUnite'] as String,
      itemQuantity: json['itemQuantity'] as double,
      itemPrice: json['itemPrice'] as String,
    );
  }
}