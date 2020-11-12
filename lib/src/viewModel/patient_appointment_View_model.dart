import 'package:flutter/cupertino.dart';
import 'package:flutter_healthcare_app/src/model/available.dart';
import 'package:flutter_healthcare_app/src/model/doctor.dart';
import 'package:flutter_healthcare_app/src/model/patient_appointment.dart';
import 'package:flutter_healthcare_app/src/theme/url.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PatientAppointmentViewModel extends ChangeNotifier {

  Future<List<PatientAppointment>> getAllPatientAppointment(String userId) async {
    final response =
    await http.get('${url.BASE_URL}getAppointment?userId=$userId&userType=Doctor');

    if (response.statusCode == 200) {
      List<PatientAppointment> patientAppointments;

      Iterable list = json.decode(response.body);
      patientAppointments = list.map((model) => PatientAppointment.fromJson(model)).toList();
      return patientAppointments;
    } else {
      throw Exception('Exception: ${response.statusCode}');
    }
  }

  Future<List<Available>> getAvailibility(String docID) async {
    final response =
    await http.get('${url.BASE_URL}getAvailibility?DocId=$docID');

    if (response.statusCode == 200) {
      List<Available> availableTimes;

      Iterable list = json.decode(response.body);
      availableTimes = list.map((model) => Available.fromJson(model)).toList();


      return availableTimes;
    } else {
      throw Exception('Exception: ${response.statusCode}');
    }
  }
}
