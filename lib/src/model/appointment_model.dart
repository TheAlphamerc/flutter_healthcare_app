import 'dart:convert';

List<Appointment> appointmentFromJson(String str) => List<Appointment>.from(json.decode(str).map((x) => Appointment.fromJson(x)));

String appointmentToJson(List<Appointment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Appointment {
  Appointment({
    this.name,
    this.date,
    this.time,
    this.age,
    this.gender,
    this.appointmentId,
  });

  String name;
  String date;
  String time;
  String age;
  String gender;
  String appointmentId;

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
    name: json["name"],
    date: json["date"],
    time: json["time"],
    age: json["age"],
    gender: json["gender"],
    appointmentId: json["appointmentId"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "date": date,
    "time": time,
    "age": age,
    "gender": gender,
    "appointmentId": appointmentId,
  };
}
