import 'dart:convert';

List<PatientAppointment> patientAppointmentFromJson(String str) => List<PatientAppointment>.from(json.decode(str).map((x) => PatientAppointment.fromJson(x)));

String patientAppointmentToJson(List<PatientAppointment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PatientAppointment {
  PatientAppointment({
    this.id,
    this.patientuid,
    this.patientName,
    this.doctorid,
    this.dates,
    this.timeid,
    this.reasons,
    this.paymethod,
    this.status,
    this.createdby,
    this.createdtime,
    this.updatedby,
    this.updatedtime,
    this.doctorName,
    this.speciality,
    this.doctorDept,
    this.appointmentTime,
    this.gender,
    this.age,
    this.queryFlag,
  });

  String id;
  String patientuid;
  String patientName;
  String doctorid;
  String dates;
  String timeid;
  String reasons;
  dynamic paymethod;
  String status;
  dynamic createdby;
  String createdtime;
  dynamic updatedby;
  dynamic updatedtime;
  String doctorName;
  String speciality;
  String doctorDept;
  String appointmentTime;
  String gender;
  String age;
  String queryFlag;

  factory PatientAppointment.fromJson(Map<String, dynamic> json) => PatientAppointment(
    id: json["Id"],
    patientuid: json["Patientuid"],
    patientName: json["PatientName"],
    doctorid: json["Doctorid"],
    dates: json["Dates"],
    timeid: json["Timeid"],
    reasons: json["Reasons"],
    paymethod: json["Paymethod"],
    status: json["Status"],
    createdby: json["Createdby"],
    createdtime: json["Createdtime"],
    updatedby: json["Updatedby"],
    updatedtime: json["Updatedtime"],
    doctorName: json["doctorName"],
    speciality: json["speciality"],
    doctorDept: json["doctorDept"],
    appointmentTime: json["appointmentTime"],
    gender: json["Gender"],
    age: json["Age"],
    queryFlag: json["QueryFlag"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Patientuid": patientuid,
    "PatientName": patientName,
    "Doctorid": doctorid,
    "Dates": dates,
    "Timeid": timeid,
    "Reasons": reasons,
    "Paymethod": paymethod,
    "Status": status,
    "Createdby": createdby,
    "Createdtime": createdtime,
    "Updatedby": updatedby,
    "Updatedtime": updatedtime,
    "doctorName": doctorName,
    "speciality": speciality,
    "doctorDept": doctorDept,
    "appointmentTime": appointmentTime,
    "Gender": gender,
    "Age": age,
    "QueryFlag": queryFlag,
  };
}
