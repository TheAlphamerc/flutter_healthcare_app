import 'package:flutter/cupertino.dart';
import 'package:flutter_healthcare_app/src/model/available.dart';
import 'package:flutter_healthcare_app/src/model/doctor.dart';
import 'package:flutter_healthcare_app/src/model/labtest.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LabTestViewModel extends ChangeNotifier {

  Future<List<LabTest>> getAllLabtest() async {
    final response =
        await http.get('http://172.16.61.221:8059/admins.asmx/getLabtest');

    if (response.statusCode == 200) {
      List<LabTest> labTests;

      Iterable list = json.decode(response.body);
      labTests = list.map((model) => LabTest.fromJson(model)).toList();
      return labTests;
    } else {
      throw Exception('Exception: ${response.statusCode}');
    }
  }

}
