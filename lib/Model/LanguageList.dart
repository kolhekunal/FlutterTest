// To parse this JSON data, do
//
//     final language = languageFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Language languageFromJson(String str) => Language.fromJson(json.decode(str));

String languageToJson(Language data) => json.encode(data.toJson());

class Language {
  Language({
    required this.success,
    required this.code,
    required this.message,
    required this.data,
  });

  bool success;
  int code;
  String message;
  List<Datum> data;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    success: json["success"],
    code: json["code"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.langId,
    required this.langDesc,
  });

  int langId;
  String langDesc;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    langId: json["lang_id"],
    langDesc: json["lang_desc"],
  );

  Map<String, dynamic> toJson() => {
    "lang_id": langId,
    "lang_desc": langDesc,
  };
}
