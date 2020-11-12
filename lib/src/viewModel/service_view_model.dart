import 'package:flutter/cupertino.dart';
import 'package:flutter_healthcare_app/src/model/service.dart';
import 'package:flutter_healthcare_app/src/model/sub_service.dart';
import 'package:flutter_healthcare_app/src/theme/url.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ServiceViewModel extends ChangeNotifier {

  Future<List<Service>> getAllService() async {
    final response =
        await http.get('${url.BASE_URL}getServices');

    if (response.statusCode == 200) {
      List<Service> services;

      Iterable list = json.decode(response.body);
      services = list.map((model) => Service.fromJson(model)).toList();

      return services;
    } else {
      throw Exception('Exception: ${response.statusCode}');
    }
  }

  Future<List<SubService>> getSubService(String serviceId) async {
    final response =
    await http.get('${url.BASE_URL}viewServiceCenter?serviceId=$serviceId');

    if (response.statusCode == 200) {
      List<SubService> services;

      Iterable list = json.decode(response.body);
      services = list.map((model) => SubService.fromJson(model)).toList();

      return services;
    } else {
      throw Exception('Exception: ${response.statusCode}');
    }
  }


}
