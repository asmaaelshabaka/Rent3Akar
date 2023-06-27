
class AreaModel {
  AreaModel(this.Name, this.Image);

  late String Name;
  late String Image;
  late String id;

  AreaModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    Name = map['Name'].toString();
    Image = map['Image'].toString();
  }
  toJson() {
    return {'Name': Name, 'Image': Image,'id':id};
  }
}
