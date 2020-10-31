import 'package:flutter/cupertino.dart';
import 'package:flutter_healthcare_app/src/model/available.dart';
import 'package:flutter_healthcare_app/src/model/doctor.dart';
import 'package:flutter_healthcare_app/src/theme/url.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DoctorViewModel extends ChangeNotifier {

  Future<List<Doctor>> getAllDoctor(String docName, String latitude,String longitude,String gernder, String rating, String exp) async {
    final response =
        await http.get('${url.BASE_URL}getDoctors?DocName=$docName&latitude=$latitude&longitude=$longitude&Gender=$gernder&exp=$exp&rating=$rating');

    if (response.statusCode == 200) {
      List<Doctor> doctors;

      Iterable list = json.decode(response.body);
      doctors = list.map((model) => Doctor.fromJson(model)).toList();
      return doctors;
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
