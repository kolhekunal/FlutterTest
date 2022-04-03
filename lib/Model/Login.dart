// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  Data({

    required this.otp,
  });


  int otp;

  factory Data.fromJson(Map<String, dynamic> json) => Data(

    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {

    "otp": otp,
  };
}
