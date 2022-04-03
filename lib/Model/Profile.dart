// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    required this.success,
    required this.code,
    required this.message,
    required this.data,
  });

  bool success;
  int code;
  String message;
  ProfileData data;


  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    success: json["success"],
    code: json["code"],
    message: json["message"],
    data: ProfileData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "message": message,
    "data": data.toJson(),
  };
}

class ProfileData {
  ProfileData({
    required this.niblUserId,
    required this.userName,
    required this.userEmail,
    required this.userLanguage,
    required this.dob,
    required this.gender,
    required this.userPhoneno,

  });
  dynamic dob;
  dynamic gender;
  String userPhoneno;
  dynamic niblUserId;
  String userName;
  String userEmail;
  List<String> userLanguage;

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
    niblUserId: json["nibl_user_id"],
    userName: json["user_name"],
    userEmail: json["user_email"],
    userPhoneno: json["user_phoneno"]==null?'':json["user_phoneno"],

    dob: json["dob"],
    gender: json["gender"],
    userLanguage: List<String>.from(json["user_language"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "nibl_user_id": niblUserId,
    "user_name": userName,
    "user_email": userEmail,
    "user_phoneno": userPhoneno,
    "dob": dob,
    "gender": gender,
    "user_language": List<dynamic>.from(userLanguage.map((x) => x)),
  };
}
