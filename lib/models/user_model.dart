class Userr {
  late String email;
  late String id;
  late String image;
  late String name;
  late String phone;

  Userr({
    required this.email,
    required this.id,
    required this.image,
    required this.name,
    required this.phone,
  });
  Userr.fromJson(Map<dynamic, dynamic> map,)
  {
    if(map==null){return;}
    email=map['email'];
    id=map['id'];
    image=map['image'];
    name=map['name'];
    phone=map['phone'];


  }


  toJson() {
    return {
      'email': email,
      'id': id,
      'image': image,
      'name': name,
      'phone': phone
    };
  }
}
