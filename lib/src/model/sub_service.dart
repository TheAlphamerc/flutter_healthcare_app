// To parse this JSON data, do
//
//     final subService = subServiceFromJson(jsonString);

import 'dart:convert';

List<SubService> subServiceFromJson(String str) => List<SubService>.from(json.decode(str).map((x) => SubService.fromJson(x)));

String subServiceToJson(List<SubService> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubService {
  SubService({
    this.id,
    this.servicecentername,
    this.serviceceneraddress,
    this.latitude,
    this.longitude,
    this.phone,
    this.email,
    this.ownername,
    this.status,
    this.createdby,
    this.createdat,
    this.servicetype,
    this.servicetypeName,
    this.servicetags,
    this.qeryflug,
  });

  String id;
  String servicecentername;
  String serviceceneraddress;
  String latitude;
  String longitude;
  String phone;
  String email;
  String ownername;
  dynamic status;
  dynamic createdby;
  dynamic createdat;
  String servicetype;
  String servicetypeName;
  String servicetags;
  dynamic qeryflug;

  factory SubService.fromJson(Map<String, dynamic> json) => SubService(
    id: json["Id"],
    servicecentername: json["Servicecentername"],
    serviceceneraddress: json["Serviceceneraddress"],
    latitude: json["Latitude"],
    longitude: json["Longitude"],
    phone: json["Phone"],
    email: json["Email"],
    ownername: json["Ownername"],
    status: json["Status"],
    createdby: json["Createdby"],
    createdat: json["Createdat"],
    servicetype: json["Servicetype"],
    servicetypeName: json["ServicetypeName"],
    servicetags: json["Servicetags"],
    qeryflug: json["qeryflug"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Servicecentername": servicecentername,
    "Serviceceneraddress": serviceceneraddress,
    "Latitude": latitude,
    "Longitude": longitude,
    "Phone": phone,
    "Email": email,
    "Ownername": ownername,
    "Status": status,
    "Createdby": createdby,
    "Createdat": createdat,
    "Servicetype": servicetype,
    "ServicetypeName": servicetypeName,
    "Servicetags": servicetags,
    "qeryflug": qeryflug,
  };
}
