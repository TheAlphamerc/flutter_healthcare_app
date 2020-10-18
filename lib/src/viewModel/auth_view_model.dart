import 'package:flutter/cupertino.dart';
import 'package:flutter_healthcare_app/src/model/available.dart';
import 'package:flutter_healthcare_app/src/model/doctor.dart';
import 'package:flutter_healthcare_app/src/model/registration.dart';
import 'package:flutter_healthcare_app/src/model/registration_response.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthViewModel extends ChangeNotifier {


  Future<RegistrationResponse> saveRegistration(Registration registration) async {
    final response =
        await http.get('http://172.16.61.221:8059/admins.asmx/userRegistraion?username=${registration.firstname}${registration.lastname}&firstname=${registration.firstname}&lastname=${registration.lastname}&useremail=${registration.useremail}&userphone=${registration.userphone}&userpass=${registration.userpass}&address=${registration.address}&gender=${registration.gender}&dob=${registration.dob}');


    if (response.statusCode == 200) {
      return RegistrationResponse.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception('Exception: ${response.statusCode}');
    }
  }

}
