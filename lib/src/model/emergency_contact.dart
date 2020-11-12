// To parse this JSON data, do
//
//     final emergency = emergencyFromJson(jsonString);

import 'dart:convert';

Emergency emergencyFromJson(String str) => Emergency.fromJson(json.decode(str));

String emergencyToJson(Emergency data) => json.encode(data.toJson());

class Emergency {
  Emergency({
    this.userid,
    this.address,
    this.userphone,
    this.postcode,
    this.createdby,
    this.createdat,
    this.emergencyList,
  });

  String userid;
  String address;
  String userphone;
  String postcode;
  String createdby;
  String createdat;
  List<EmergencyContactList> emergencyList;

  factory Emergency.fromJson(Map<String, dynamic> json) => Emergency(
    userid: json["Userid"],
    address: json["Address"],
    userphone: json["Userphone"],
    postcode: json["postcode"],
    createdby: json["Createdby"],
    createdat: json["Createdat"],
    emergencyList: List<EmergencyContactList>.from(json["EmergencyList"].map((x) => EmergencyContactList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Userid": userid,
    "Address": address,
    "Userphone": userphone,
    "postcode": postcode,
    "Createdby": createdby,
    "Createdat": createdat,
    "EmergencyList": List<dynamic>.from(emergencyList.map((x) => x.toJson())),
  };
}

class EmergencyContactList {
  EmergencyContactList({
    this.emergencycontactperson,
    this.emergencycontactphone,
  });

  String emergencycontactperson;
  String emergencycontactphone;

  factory EmergencyContactList.fromJson(Map<String, dynamic> json) => EmergencyContactList(
    emergencycontactperson: json["Emergencycontactperson"],
    emergencycontactphone: json["Emergencycontactphone"],
  );

  Map<String, dynamic> toJson() => {
    "Emergencycontactperson": emergencycontactperson,
    "Emergencycontactphone": emergencycontactphone,
  };
}
