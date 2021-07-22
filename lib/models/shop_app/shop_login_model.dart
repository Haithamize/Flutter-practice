class ShopLoginModel {
  // bool status;

  // UserData data ;
  String token;
  User user;

  ShopLoginModel.fromJson(Map<String, dynamic> json){
    // status = json['status'];
    // message = json['message'];
    // data = json['data'] != null ? UserData.fromJson(json['data']) : null;
    user = User.fromJson(json['user']);
    token = json['token'];
  }
}

class User {

  String firstName;
  String lastName;
  String email;
  bool mobileVerified;
  bool emailVerified;
  String mobile;
  String gender;
  String birthDate;
  String image;
  String userToken;

  User.fromJson(Map<String,dynamic> json){
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    mobileVerified = json['mobileVerified'];
    emailVerified = json['emailVerified'];
    mobile = json['mobile'];
    gender = json['gender'];
    birthDate = json['birthDate'];
    image = json['image'];
    userToken = json['token'];
  }
}

// class UserData{
//   int id;
//   String name;
//   String email;
//   String phone;
//   String image;
//   int point;
//   int credit;
//   String token;
//
//
//   UserData.fromJson(Map<String, dynamic> json){
//     id= json['id'];
//     name= json['name'];
//     email= json['email'];
//     phone= json['phone'];
//     image= json['image'];
//     point= json['point'];
//     credit= json['credit'];
//     token= json['token'];
//   }
//
// }