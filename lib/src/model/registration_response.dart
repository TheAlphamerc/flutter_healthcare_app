// To parse this JSON data, do
//
//     final resgistrationResponse = resgistrationResponseFromJson(jsonString);

import 'dart:convert';

RegistrationResponse resgistrationResponseFromJson(String str) => RegistrationResponse.fromJson(json.decode(str));

String resgistrationResponseToJson(RegistrationResponse data) => json.encode(data.toJson());

class   RegistrationResponse {
  RegistrationResponse({
    this.success,
    this.message,
    this.id,
  });

  bool success;
  String message;
  String id;

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) => RegistrationResponse(
    success: json["Success"],
    message: json["Message"],
    id: json["Id"],
  );

  Map<String, dynamic> toJson() => {
    "Success": success,
    "Message": message,
    "Id": id,
  };
}
