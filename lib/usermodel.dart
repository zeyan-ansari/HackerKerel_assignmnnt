class LoginResponseModel{
  final String token;
  final String error;

  LoginResponseModel({required this.error,required this.token});

  factory LoginResponseModel.fromJson(Map<String,dynamic>json){
    return LoginResponseModel(token: json["token"]!= null ? json["token"]:"",error: json["error"] != null ? json["error"]:"");
  }
}

class User {
  late String email;
  late String password;

  User({required this.email, required this.password});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}