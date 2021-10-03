// To parse this JSON data, do
//
//     final service = serviceFromJson(jsonString);

import 'dart:convert';

List<Service> serviceFromJson(String str) => List<Service>.from(json.decode(str).map((x) => Service.fromJson(x)));

String serviceToJson(List<Service> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Service {
    Service({
        this.id,
        this.name,
        this.description,
        this.icon,
        this.type,
        this.isactive,
        this.createdby,
        this.createdtime,
        this.updatedby,
        this.updatedtime,
        this.sortby,
        this.isview,
        this.viewby,
        this.viewtime,
        this.jsonDetails,
        this.queryFlag,
    });

    String id;
    String name;
    String description;
    dynamic icon;
    dynamic type;
    dynamic isactive;
    dynamic createdby;
    dynamic createdtime;
    dynamic updatedby;
    dynamic updatedtime;
    dynamic sortby;
    dynamic isview;
    dynamic viewby;
    dynamic viewtime;
    dynamic jsonDetails;
    dynamic queryFlag;

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["Id"],
        name: json["Name"],
        description: json["Description"],
        icon: json["Icon"],
        type: json["Type"],
        isactive: json["Isactive"],
        createdby: json["Createdby"],
        createdtime: json["Createdtime"],
        updatedby: json["Updatedby"],
        updatedtime: json["Updatedtime"],
        sortby: json["Sortby"],
        isview: json["Isview"],
        viewby: json["Viewby"],
        viewtime: json["Viewtime"],
        jsonDetails: json["JsonDetails"],
        queryFlag: json["QueryFlag"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Description": description,
        "Icon": icon,
        "Type": type,
        "Isactive": isactive,
        "Createdby": createdby,
        "Createdtime": createdtime,
        "Updatedby": updatedby,
        "Updatedtime": updatedtime,
        "Sortby": sortby,
        "Isview": isview,
        "Viewby": viewby,
        "Viewtime": viewtime,
        "JsonDetails": jsonDetails,
        "QueryFlag": queryFlag,
    };
}
