// To parse this JSON data, do
//
//     final personItemModel = personItemModelFromJson(jsonString);

import 'dart:convert';

UserModel personItemModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String personItemModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.username,
    required this.email,
    required this.phone,
  });

  String username;
  String email;
  String phone;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    username: json["username"],
    email: json["email"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "email": email,
    "phone": phone,
  };
}
