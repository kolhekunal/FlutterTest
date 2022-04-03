// To parse this JSON data, do
//
//     final home = homeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Home homeFromJson(String str) => Home.fromJson(json.decode(str));

String homeToJson(Home data) => json.encode(data.toJson());

class Home {
  Home({
    required this.success,
    required this.code,
    required this.message,
    required this.data,
  });

  bool success;
  int code;
  String message;
  Data data;

  factory Home.fromJson(Map<String, dynamic> json) => Home(
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
    required this.slider,
    required this.card,
    required this.middle,
    required this.bottom,
  });

  List<String> slider;
  List<Card> card;
  Bottom middle;
  Bottom bottom;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    slider: List<String>.from(json["slider"].map((x) => x)),
    card: List<Card>.from(json["card"].map((x) => Card.fromJson(x))),
    middle: Bottom.fromJson(json["middle"]),
    bottom: Bottom.fromJson(json["bottom"]),
  );

  Map<String, dynamic> toJson() => {
    "slider": List<dynamic>.from(slider.map((x) => x)),
    "card": List<dynamic>.from(card.map((x) => x.toJson())),
    "middle": middle.toJson(),
    "bottom": bottom.toJson(),
  };
}

class Bottom {
  Bottom({
    required this.text,
    required this.url,
  });

  String text;
  List<String> url;

  factory Bottom.fromJson(Map<String, dynamic> json) => Bottom(
    text: json["text"],
    url: List<String>.from(json["url"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "url": List<dynamic>.from(url.map((x) => x)),
  };
}

class Card {
  Card({
    required this.text,
    required this.btnText,
  });

  String text;
  String btnText;

  factory Card.fromJson(Map<String, dynamic> json) => Card(
    text: json["text"],
    btnText: json["btnText"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "btnText": btnText,
  };
}
