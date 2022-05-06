// To parse this JSON data, do
//     final dataModelToken = dataModelTokenFromJson(jsonString);

// This is a token dataModel class to encode/decode token we would receive in login procedure
import 'dart:convert';

DataModelToken dataModelTokenFromJson(String str) => DataModelToken.fromJson(json.decode(str));

String dataModelTokenToJson(DataModelToken data) => json.encode(data.toJson());

class DataModelToken {
  DataModelToken({
    required this.token,
  });

  String token;

  factory DataModelToken.fromJson(Map<String, dynamic> json) => DataModelToken(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
