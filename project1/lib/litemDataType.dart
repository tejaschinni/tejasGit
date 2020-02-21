

class Items{
  final String itemEnglishName;
  final String itemsHindiName;
  final String itemsMarathiName;


  Items({this.itemEnglishName,this.itemsHindiName,this.itemsMarathiName});

  factory Items.fromJson(Map<String,dynamic>json){
    return Items(
      itemEnglishName: json['itemEnglishName'] as String,
      itemsHindiName: json['itemHindiName'] as String,
      itemsMarathiName: json['itemMarathiName'] as String,
    );
  }
}