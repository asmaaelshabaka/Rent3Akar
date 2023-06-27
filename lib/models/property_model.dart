class Propertymodel {
  late String address;
  late String RentCost;
  late String IDarea;
  late String IDKindProperty;
  late String imageUrl;
  late String VideoURL;
  late String? Location;
  late String? MoreData;
  late String? IncreaseRate;
  late String Space;
  late String id;
  late String ownerID;
  late String userID;

  Propertymodel(
      {required this.address,
      required this.RentCost,
      required this.IDarea,
      required this.IDKindProperty,
      required this.imageUrl,
      required this.VideoURL,
      this.Location,
      this.MoreData,
      this.IncreaseRate,
      required this.Space,required this.ownerID,required this.userID});
  Propertymodel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null)
    {
      return;
    }
    address=map['address'];
    RentCost=map['RentCost'];
    IDarea=map['IDarea'];
    IDKindProperty=map['IDKindProperty'];
    imageUrl=map['imageUrl'];
    VideoURL=map['VideoURL'];
    Location=map['Location'];
    MoreData=map['MoreData'];
    IncreaseRate=map['IncreaseRate'];
    Space=map['Space'];
    ownerID=map['ownerID'];
    userID=map['userID'];


  }
  toJson()
  {return
    {
      'address':address,
      'RentCost':RentCost,
      'IDarea':IDarea,
      'IDKindProperty':IDKindProperty,
      'imageUrl':imageUrl,
      'VideoURL':VideoURL,
      'Location':Location,
      'MoreData':MoreData,
      'IncreaseRate':IncreaseRate,
      'Space':Space,
      'id':id,
      'userID':userID
      
  };}
}
