// To parse this JSON data, do
//
//     final dataModelToken = dataModelTokenFromJson(jsonString);

import 'dart:convert';

// This is a dataModel class for events which we will use to encode or decode the event data

DataModelEvent dataModelEventFromJson(String str) => DataModelEvent.fromJson(json.decode(str));

String dataModelEventToJson(DataModelEvent data) => json.encode(data.toJson());

class DataModelEvent {
  DataModelEvent({
    required this.id,
    required this.name,
    required this.start,
    required this.end,
  });

  String id;
  String name;
  String start;
  String end;

  factory DataModelEvent.fromJson(Map<String, dynamic> json) => DataModelEvent(
        id: json["id"],
        name: json["name"],
        start: json["start"],
        end: json["end"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "start": start,
        "end": end,
      };
}
