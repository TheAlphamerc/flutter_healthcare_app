import 'package:flutter/cupertino.dart';
import 'package:flutter_healthcare_app/src/model/service.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ServiceViewModel extends ChangeNotifier {

  Future<List<Service>> getAllService() async {
    final response =
        await http.get('http://172.16.61.221:8059/admins.asmx/getServices');

    if (response.statusCode == 200) {
      List<Service> services;

      Iterable list = json.decode(response.body);
      services = list.map((model) => Service.fromJson(model)).toList();

      return services;
    } else {
      throw Exception('Exception: ${response.statusCode}');
    }
  }


}
