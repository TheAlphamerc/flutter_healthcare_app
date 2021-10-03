// To parse this JSON data, do
//
//     final doctor = doctorFromJson(jsonString);

import 'dart:convert';

List<Doctor> doctorFromJson(String str) =>
    List<Doctor>.from(json.decode(str).map((x) => Doctor.fromJson(x)));

String doctorToJson(List<Doctor> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
  String experience;
  String about;
  String fees;
  String joindate;
  String photo;
  String gender;
  bool isactive;
  String createdby;
  String createdtime;
  String updatedby;
  String updatedtime;
  String sortby;
  bool isview;
  String viewby;
  dynamic viewtime;
  String doctroRating;
  String location;
  String latitude;
  String longitude;
  String jsonDetails;
  String queryFlag;

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

  factory Doctor.first() {
    return Doctor(
        id: "1",
        name: "Dr. S.K. Gupta",
        department: "Cardiology",
        specialist: "Cardiologist",
        phone: "9876543210",
        education: "MBBS, MD",
        experience: "10 years",
        about: "Dr. S.K. Gupta is a famous doctor for Cardiology",
        fees: "Rs. 5000",
        joindate: "01-01-2020",
        createdby: "1",
        createdtime: "01-01-2020",
        updatedby: "1",
        updatedtime: "01-01-2020",
        sortby: "1",
        isview: true,
        viewby: "1",
        viewtime: "01-01-2020",
        doctroRating: "4.5",
        location: "Delhi",
        latitude: "28.6139",
        longitude: "77.2090",
        jsonDetails: "",
        queryFlag: "1",
        gender: "Male",
        isactive: true,
        photo:
            "https://yt3.ggpht.com/ytc/AKedOLQ-TfQ3t1-kxvAZ1P7eg7eS78fYMHfgiuFwbbph=s900-c-k-c0x00ffffff-no-rj");
  }
}
