class UserModel {

  String firstName;
  String lastName;
  String email;
  bool mobileVerified;
  bool emailVerified;
  String mobile;
  String gender;
  String birthDate;
  int id;

  UserModel.fromJson(Map<String,dynamic> json){
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    mobileVerified = json['mobileVerified'];
    emailVerified = json['emailVerified'];
    mobile = json['mobile'];
    gender = json['gender'];
    birthDate = json['birthDate'];
    id = json['_id'];
  }
}