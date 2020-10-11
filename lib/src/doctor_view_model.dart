import 'package:flutter/cupertino.dart';
import 'package:flutter_healthcare_app/src/model/available.dart';
import 'package:flutter_healthcare_app/src/model/doctor.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DoctorViewModel extends ChangeNotifier {
  List<Doctor> allDoctor = new List();

  Future<List<Doctor>> getAllDoctor() async {
    final response =
        await http.get('http://172.16.61.221:8059/admins.asmx/getDoctors');

    if (response.statusCode == 200) {
      List<Doctor> doctors;

      Iterable list = json.decode(response.body);
      doctors = list.map((model) => Doctor.fromJson(model)).toList();
      if(allDoctor != null){
        allDoctor.clear();
      }
      allDoctor.addAll(doctors);
      notifyListeners();
      print(doctors);

      return doctors;
    } else {
      throw Exception('Exception: ${response.statusCode}');
    }
  }

  Future<List<Available>> getAvailibility(String docID) async {
    final response =
    await http.get('http://172.16.61.221:8059/admins.asmx/getAvailibility?DocId=$docID');

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
