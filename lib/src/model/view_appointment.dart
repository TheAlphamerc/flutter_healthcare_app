import 'dart:convert';

List<ViewAppointment> viewAppointmentFromJson(String str) => List<ViewAppointment>.from(json.decode(str).map((x) => ViewAppointment.fromJson(x)));

String viewAppointmentToJson(List<ViewAppointment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ViewAppointment {
  ViewAppointment({
    this.id,
    this.patientuid,
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
    this.queryFlag,
  });

  String id;
  dynamic patientuid;
  String doctorid;
  String dates;
  dynamic timeid;
  String reasons;
  dynamic paymethod;
  String status;
  dynamic createdby;
  dynamic createdtime;
  dynamic updatedby;
  dynamic updatedtime;
  String doctorName;
  String speciality;
  String doctorDept;
  String appointmentTime;
  dynamic queryFlag;

  factory ViewAppointment.fromJson(Map<String, dynamic> json) => ViewAppointment(
    id: json["Id"],
    patientuid: json["Patientuid"],
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
    queryFlag: json["QueryFlag"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Patientuid": patientuid,
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
    "QueryFlag": queryFlag,
  };
}
