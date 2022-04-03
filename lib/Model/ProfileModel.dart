// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    required this.success,
    required this.code,
    required this.message,
    required this.data,
  });

  bool success;
  int code;
  String message;
  Data data;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    success: json["success"],
    code: json["code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.niblUserId,
    required this.userPhoneno,
    required this.userName,
    required this.userEmail,
    required this.userLanguage,
    required this.dob,
    required this.gender,
  });

  int niblUserId;
  String userPhoneno;
  String userName;
  String userEmail;
  List<String> userLanguage;
  dynamic dob;
  dynamic gender;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    niblUserId: json["nibl_user_id"],
    userPhoneno: json["user_phoneno"],
    userName: json["user_name"],
    userEmail: json["user_email"],
    userLanguage: List<String>.from(json["user_language"].map((x) => x)),
    dob: json["dob"],
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "nibl_user_id": niblUserId,
    "user_phoneno": userPhoneno,
    "user_name": userName,
    "user_email": userEmail,
    "user_language": List<dynamic>.from(userLanguage.map((x) => x)),
    "dob": dob,
    "gender": gender,
  };
}
