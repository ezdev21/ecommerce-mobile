import 'dart:convert';

class User{
  int id;
  String name;
  String email;
  String avatar;
  //User({this.name,this.email,this.avatar});
  User.fromJson(Map<String,dynamic> json)
  : id=json['id'], 
    name=json['name'],
    email=json['email'],
    avatar=json['avatar'];
}