import 'package:flutter/cupertino.dart';
import 'package:flutter_healthcare_app/src/model/appointment.dart';
import 'package:flutter_healthcare_app/src/model/available.dart';
import 'package:flutter_healthcare_app/src/model/doctor.dart';
import 'package:flutter_healthcare_app/src/model/login_response.dart';
import 'package:flutter_healthcare_app/src/model/registration.dart';
import 'package:flutter_healthcare_app/src/model/registration_response.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AppointmentViewModel extends ChangeNotifier {


  Future<RegistrationResponse> saveAppointment(Appointment appointment) async {
    final response =
        await http.get('http://172.16.61.221:8059/admins.asmx/userAppointment?Patientuid=${appointment.patientuid}&Doctorid=${appointment.doctorid}&Dates=${appointment.dates}&Timeid=${appointment.timeid}&Reasons=${appointment.reasons}&payment=${appointment.paymen}');

    if (response.statusCode == 200) {
      return RegistrationResponse.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception('Exception: ${response.statusCode}');
    }
  }




}
