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
  });

  String id;
  String doctorid;
  String days;
  String times;
  dynamic isactive;
  dynamic createdby;
  dynamic createdtime;
  dynamic updatedby;
  dynamic updatedtime;
  dynamic queryFlag;

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
  };
}
