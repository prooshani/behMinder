// To parse this JSON data, do
//     final dataModel = dataModelFromJson(jsonString);

//This the login request data model to encode/decode login json responses

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    required this.key,
  });

  String key;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        key: json["key"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
      };
}
