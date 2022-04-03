// To parse this JSON data, do
//
//     final policyBenefits = policyBenefitsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PolicyBenefits policyBenefitsFromJson(String str) => PolicyBenefits.fromJson(json.decode(str));

String policyBenefitsToJson(PolicyBenefits data) => json.encode(data.toJson());

class PolicyBenefits {
  PolicyBenefits({
    required this.success,
    required this.code,
    required this.message,
    required this.data,
  });

  bool success;
  int code;
  String message;
  Data data;

  factory PolicyBenefits.fromJson(Map<String, dynamic> json) => PolicyBenefits(
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
    required this.header,
    required this.benefits,
  });

  String header;
  List<Benefit> benefits;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    header: json["header"],
    benefits: List<Benefit>.from(json["benefits"].map((x) => Benefit.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "header": header,
    "benefits": List<dynamic>.from(benefits.map((x) => x.toJson())),
  };
}

class Benefit {
  Benefit({
    required this.title,
    required this.text,
  });

  String title;
  String text;

  factory Benefit.fromJson(Map<String, dynamic> json) => Benefit(
    title: json["title"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "text": text,
  };
}
