// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  CityModel({
    required this.success,
    required this.code,
    required this.message,
    required this.data,
  });

  bool success;
  int code;
  String message;
  List<CityData> data;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    success: json["success"],
    code: json["code"],
    message: json["message"],
    data: List<CityData>.from(json["data"].map((x) => CityData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CityData {
  CityData({
    required this.cityId,
    required this.stateId,
    required this.cityName,
     this.createdAt,
     this.updatedAt,
  });

  int cityId;
  int stateId;
  String cityName;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory CityData.fromJson(Map<String, dynamic> json) => CityData(
    cityId: json["city_id"],
    stateId: json["state_id"],
    cityName: json["city_name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "city_id": cityId,
    "state_id": stateId,
    "city_name": cityName,
    "created_at": "${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
    "updated_at": "${updatedAt!.year.toString().padLeft(4, '0')}-${updatedAt!.month.toString().padLeft(2, '0')}-${updatedAt!.day.toString().padLeft(2, '0')}",
  };
}
