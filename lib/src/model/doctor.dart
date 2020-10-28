// To parse this JSON data, do
//
//     final doctor = doctorFromJson(jsonString);

import 'dart:convert';

List<Doctor> doctorFromJson(String str) => List<Doctor>.from(json.decode(str).map((x) => Doctor.fromJson(x)));

String doctorToJson(List<Doctor> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Doctor {
  Doctor({
    this.id,
    this.name,
    this.department,
    this.specialist,
    this.phone,
    this.education,
    this.experience,
    this.about,
    this.fees,
    this.joindate,
    this.photo,
    this.gender,
    this.isactive,
    this.createdby,
    this.createdtime,
    this.updatedby,
    this.updatedtime,
    this.sortby,
    this.isview,
    this.viewby,
    this.viewtime,
    this.doctroRating,
    this.location,
    this.latitude,
    this.longitude,
    this.jsonDetails,
    this.queryFlag,
  });

  String id;
  String name;
  String department;
  String specialist;
  String phone;
  String education;
  dynamic experience;
  String about;
  String fees;
  dynamic joindate;
  String photo;
  dynamic gender;
  dynamic isactive;
  dynamic createdby;
  dynamic createdtime;
  dynamic updatedby;
  dynamic updatedtime;
  dynamic sortby;
  dynamic isview;
  dynamic viewby;
  dynamic viewtime;
  String doctroRating;
  String location;
  String latitude;
  String longitude;
  dynamic jsonDetails;
  dynamic queryFlag;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json["Id"],
    name: json["Name"],
    department: json["Department"],
    specialist: json["Specialist"],
    phone: json["phone"],
    education: json["Education"],
    experience: json["Experience"],
    about: json["About"],
    fees: json["Fees"],
    joindate: json["Joindate"],
    photo: json["Photo"],
    gender: json["Gender"],
    isactive: json["Isactive"],
    createdby: json["Createdby"],
    createdtime: json["Createdtime"],
    updatedby: json["Updatedby"],
    updatedtime: json["Updatedtime"],
    sortby: json["Sortby"],
    isview: json["Isview"],
    viewby: json["Viewby"],
    viewtime: json["Viewtime"],
    doctroRating: json["DoctroRating"],
    location: json["Location"],
    latitude: json["Latitude"],
    longitude: json["Longitude"],
    jsonDetails: json["JsonDetails"],
    queryFlag: json["QueryFlag"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "Department": department,
    "Specialist": specialist,
    "phone": phone,
    "Education": education,
    "Experience": experience,
    "About": about,
    "Fees": fees,
    "Joindate": joindate,
    "Photo": photo,
    "Gender": gender,
    "Isactive": isactive,
    "Createdby": createdby,
    "Createdtime": createdtime,
    "Updatedby": updatedby,
    "Updatedtime": updatedtime,
    "Sortby": sortby,
    "Isview": isview,
    "Viewby": viewby,
    "Viewtime": viewtime,
    "DoctroRating": doctroRating,
    "Location": location,
    "Latitude": latitude,
    "Longitude": longitude,
    "JsonDetails": jsonDetails,
    "QueryFlag": queryFlag,
  };
}
