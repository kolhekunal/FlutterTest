// To parse this JSON data, do
//
//     final stateModel = stateModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

StateModel stateModelFromJson(String str) => StateModel.fromJson(json.decode(str));

String stateModelToJson(StateModel data) => json.encode(data.toJson());

class StateModel {
  StateModel({
    required this.success,
    required this.code,
    required this.message,
    required this.data,
  });

  bool success;
  int code;
  String message;
  List<StateData> data;

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
    success: json["success"],
    code: json["code"],
    message: json["message"],
    data: List<StateData>.from(json["data"].map((x) => StateData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class StateData {
  StateData({
    required this.stateId,
    required this.stateName,
     this.createdAt,
     this.updatedAt,
  });

  int stateId;
  String stateName;
  dynamic createdAt;
  dynamic updatedAt;

  factory StateData.fromJson(Map<String, dynamic> json) => StateData(
    stateId: json["state_id"],
    stateName: json["state_name"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "state_id": stateId,
    "state_name": stateName,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
