// To parse this JSON data, do
//
//     final servicesModel = servicesModelFromJson(jsonString);

import 'dart:convert';

List<ServicesModel> servicesModelFromJson(String str) =>
    List<ServicesModel>.from(
        json.decode(str).map((x) => ServicesModel.fromJson(x)));

String servicesModelToJson(List<ServicesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServicesModel {
  ServicesModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory ServicesModel.fromJson(Map<String, dynamic> json) => ServicesModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
