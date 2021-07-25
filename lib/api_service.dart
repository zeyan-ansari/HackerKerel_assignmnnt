import 'package:assignment/usermodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService{
Future<LoginResponseModel> login(User user)  async{
  // String url = (Uri.parse("https://reqres.in/api/login"));
  
  final response = await http.post(Uri.parse("https://reqres.in/api/login"),body: user.toJson());
  if(response.statusCode==200|| response.statusCode==400){
    return LoginResponseModel.fromJson(json.decode(response.body));

  }
  else{
    throw Exception('Failed to load data');
  }
}
}