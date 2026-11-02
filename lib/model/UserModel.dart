class UserModel {
  String ?name;
  String ?id;
  String ?email;
  UserModel({this.name, this.id, this.email});
  UserModel.fromFireStore(Map<String, dynamic> data){
    name=data['name'];
    id=data['id'];
    email=data['email'];
  }
  Map<String, dynamic> toFireStore() {
    return {
      'name': name,
      'id': id,
      'email': email,
    };
  }
}