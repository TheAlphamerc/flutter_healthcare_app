// To parse this JSON data, do
//
//     final contactDetails = contactDetailsFromJson(jsonString);

import 'dart:convert';

ContactDetails contactDetailsFromJson(String str) => ContactDetails.fromJson(json.decode(str));

String contactDetailsToJson(ContactDetails data) => json.encode(data.toJson());

class ContactDetails {
  ContactDetails({
    this.userid,
    this.address,
    this.userphone,
    this.postcode,
    this.createdby,
    this.createdat,
    this.updateby,
    this.upadateat,
    this.id,
    this.emergencycontactperson,
    this.emergencycontactphone,
    this.emergencyList,
  });

  String userid;
  String address;
  String userphone;
  String postcode;
  String createdby;
  String createdat;
  dynamic updateby;
  dynamic upadateat;
  dynamic id;
  dynamic emergencycontactperson;
  dynamic emergencycontactphone;
  List<EmergencyList> emergencyList;

  factory ContactDetails.fromJson(Map<String, dynamic> json) => ContactDetails(
    userid: json["Userid"],
    address: json["Address"],
    userphone: json["Userphone"],
    postcode: json["postcode"],
    createdby: json["Createdby"],
    createdat: json["Createdat"],
    updateby: json["Updateby"],
    upadateat: json["Upadateat"],
    id: json["Id"],
    emergencycontactperson: json["Emergencycontactperson"],
    emergencycontactphone: json["Emergencycontactphone"],
    emergencyList: List<EmergencyList>.from(json["EmergencyList"].map((x) => EmergencyList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Userid": userid,
    "Address": address,
    "Userphone": userphone,
    "postcode": postcode,
    "Createdby": createdby,
    "Createdat": createdat,
    "Updateby": updateby,
    "Upadateat": upadateat,
    "Id": id,
    "Emergencycontactperson": emergencycontactperson,
    "Emergencycontactphone": emergencycontactphone,
    "EmergencyList": List<dynamic>.from(emergencyList.map((x) => x.toJson())),
  };
}

class EmergencyList {
  EmergencyList({
    this.id,
    this.emergencycontactperson,
    this.emergencycontactphone,
  });

  String id;
  String emergencycontactperson;
  String emergencycontactphone;

  factory EmergencyList.fromJson(Map<String, dynamic> json) => EmergencyList(
    id: json["Id"],
    emergencycontactperson: json["Emergencycontactperson"],
    emergencycontactphone: json["Emergencycontactphone"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Emergencycontactperson": emergencycontactperson,
    "Emergencycontactphone": emergencycontactphone,
  };
}
