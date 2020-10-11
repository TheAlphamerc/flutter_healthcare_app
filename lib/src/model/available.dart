// To parse this JSON data, do
//
//     final availbility = availbilityFromJson(jsonString);

import 'dart:convert';

List<Available> availbilityFromJson(String str) => List<Available>.from(json.decode(str).map((x) => Available.fromJson(x)));

String availbilityToJson(List<Available> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Available {
  Available({
    this.id,
    this.doctorid,
    this.days,
    this.times,
    this.isactive,
    this.createdby,
    this.createdtime,
    this.updatedby,
    this.updatedtime,
    this.queryFlag,
    this.getTimeByDay,
    this.sunday,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
  });

  dynamic id;
  dynamic doctorid;
  dynamic days;
  dynamic times;
  dynamic isactive;
  dynamic createdby;
  dynamic createdtime;
  dynamic updatedby;
  dynamic updatedtime;
  dynamic queryFlag;
  bool getTimeByDay;
  String sunday;
  String monday;
  String tuesday;
  String wednesday;
  String thursday;
  String friday;
  String saturday;

  factory Available.fromJson(Map<String, dynamic> json) => Available(
    id: json["Id"],
    doctorid: json["Doctorid"],
    days: json["Days"],
    times: json["Times"],
    isactive: json["Isactive"],
    createdby: json["Createdby"],
    createdtime: json["Createdtime"],
    updatedby: json["Updatedby"],
    updatedtime: json["Updatedtime"],
    queryFlag: json["QueryFlag"],
    getTimeByDay: json["GetTimeByDay"],
    sunday: json["Sunday"],
    monday: json["Monday"],
    tuesday: json["Tuesday"],
    wednesday: json["Wednesday"],
    thursday: json["Thursday"],
    friday: json["Friday"],
    saturday: json["Saturday"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Doctorid": doctorid,
    "Days": days,
    "Times": times,
    "Isactive": isactive,
    "Createdby": createdby,
    "Createdtime": createdtime,
    "Updatedby": updatedby,
    "Updatedtime": updatedtime,
    "QueryFlag": queryFlag,
    "GetTimeByDay": getTimeByDay,
    "Sunday": sunday,
    "Monday": monday,
    "Tuesday": tuesday,
    "Wednesday": wednesday,
    "Thursday": thursday,
    "Friday": friday,
    "Saturday": saturday,
  };
}
