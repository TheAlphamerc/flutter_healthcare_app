import 'package:flutter/cupertino.dart';
import 'package:flutter_healthcare_app/src/model/appointment.dart';
import 'package:flutter_healthcare_app/src/model/registration_response.dart';
import 'package:flutter_healthcare_app/src/model/view_appointment.dart';
import 'package:flutter_healthcare_app/src/theme/url.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AppointmentViewModel extends ChangeNotifier {
  Future<RegistrationResponse> saveAppointment(Appointment appointment) async {
    final response = await http.get(
        '${url.BASE_URL}userAppointment?Patientuid=${appointment.patientuid}&Doctorid=${appointment.doctorid}&Dates=${appointment.dates}&Timeid=${appointment.timeid}&Reasons=${appointment.reasons}&payment=${appointment.paymen}');

    if (response.statusCode == 200) {
      return RegistrationResponse.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception('Exception: ${response.statusCode}');
    }
  }

  Future<RegistrationResponse> updateAppointment(Appointment appointment,String appointmentId) async {
    final response = await http.get(
        '${url.BASE_URL}updateAppointment?appointmentId=$appointmentId&userid=${appointment.patientuid}&docid=${appointment.doctorid}&appointmentDate=${appointment.dates}&timeId=${appointment.timeid}&reason=${appointment.reasons}&paymenthod=${appointment.paymen}');

    if (response.statusCode == 200) {
      return RegistrationResponse.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception('Exception: ${response.statusCode}');
    }
  }

  Future<List<ViewAppointment>> getAllAppointment(String id, String userType) async {
    final response = await http
        .get('${url.BASE_URL}getAppointment?userId=$id&userType=$userType');

    print(response.body);
    if (response.statusCode == 200) {
      List<ViewAppointment> appointment;

      Iterable list = json.decode(response.body);
      appointment =
          list.map((model) => ViewAppointment.fromJson(model)).toList();
      return appointment;
    } else {
      throw Exception('Exception: ${response.statusCode}');
    }
  }

  Future<RegistrationResponse> cancelAppointment(String id) async {
    final response = await http.get(
        '${url.BASE_URL}cancelAppointment?appointmentId=$id');

    print(response.body);
    if (response.statusCode == 200) {
      return RegistrationResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Exception: ${response.statusCode}');
    }
  }
}
