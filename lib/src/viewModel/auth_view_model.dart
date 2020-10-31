import 'package:flutter/cupertino.dart';
import 'package:flutter_healthcare_app/src/model/login_response.dart';
import 'package:flutter_healthcare_app/src/model/registration.dart';
import 'package:flutter_healthcare_app/src/model/registration_response.dart';
import 'package:flutter_healthcare_app/src/theme/url.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthViewModel extends ChangeNotifier {


  Future<RegistrationResponse> saveRegistration(Registration registration) async {
    final response =
        await http.get('${url.BASE_URL}userRegistraion?username=${registration.firstname}${registration.lastname}&firstname=${registration.firstname}&lastname=${registration.lastname}&useremail=${registration.useremail}&userphone=${registration.userphone}&userpass=${registration.userpass}&address=${registration.address}&gender=${registration.gender}&dob=${registration.dob}');


    if (response.statusCode == 200) {
      return RegistrationResponse.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception('Exception: ${response.statusCode}');
    }
  }


  Future<List<LoginResponse>> getlogin(String email, String password) async {
    final response =
    await http.get('${url.BASE_URL}userLogin?email=$email&pass=$password');

    if (response.statusCode == 200) {
      List<LoginResponse> loginResponseList;

      Iterable list = json.decode(response.body);
      loginResponseList = list.map((model) => LoginResponse.fromJson(model)).toList();
      return loginResponseList;
    } else {
      throw Exception('Exception: ${response.statusCode}');
    }
  }

}
