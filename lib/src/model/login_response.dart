// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

List<LoginResponse> loginResponseFromJson(String str) => List<LoginResponse>.from(json.decode(str).map((x) => LoginResponse.fromJson(x)));

String loginResponseToJson(List<LoginResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoginResponse {
  LoginResponse({
    this.id,
    this.logname,
    this.logpass,
    this.securPass,
    this.email,
    this.firstName,
    this.lastName,
    this.username,
    this.userphone,
    this.gender,
    this.userdob,
    this.address,
    this.usertype,
    this.userid,
    this.roleid,
    this.isactive,
    this.createdby,
    this.createdtime,
    this.updatedby,
    this.updatedtime,
    this.lastlogin,
    this.queryFlag,
    this.confirmPass,
  });

  String id;
  dynamic logname;
  String logpass;
  dynamic securPass;
  String email;
  String firstName;
  String lastName;
  dynamic username;
  dynamic userphone;
  dynamic gender;
  dynamic userdob;
  dynamic address;
  String usertype;
  dynamic userid;
  dynamic roleid;
  dynamic isactive;
  dynamic createdby;
  dynamic createdtime;
  dynamic updatedby;
  dynamic updatedtime;
  dynamic lastlogin;
  dynamic queryFlag;
  dynamic confirmPass;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    id: json["Id"],
    logname: json["Logname"],
    logpass: json["Logpass"],
    securPass: json["SecurPass"],
    email: json["Email"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    username: json["username"],
    userphone: json["userphone"],
    gender: json["Gender"],
    userdob: json["userdob"],
    address: json["Address"],
    usertype: json["Usertype"],
    userid: json["Userid"],
    roleid: json["Roleid"],
    isactive: json["Isactive"],
    createdby: json["Createdby"],
    createdtime: json["Createdtime"],
    updatedby: json["Updatedby"],
    updatedtime: json["Updatedtime"],
    lastlogin: json["Lastlogin"],
    queryFlag: json["QueryFlag"],
    confirmPass: json["ConfirmPass"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Logname": logname,
    "Logpass": logpass,
    "SecurPass": securPass,
    "Email": email,
    "FirstName": firstName,
    "LastName": lastName,
    "username": username,
    "userphone": userphone,
    "Gender": gender,
    "userdob": userdob,
    "Address": address,
    "Usertype": usertype,
    "Userid": userid,
    "Roleid": roleid,
    "Isactive": isactive,
    "Createdby": createdby,
    "Createdtime": createdtime,
    "Updatedby": updatedby,
    "Updatedtime": updatedtime,
    "Lastlogin": lastlogin,
    "QueryFlag": queryFlag,
    "ConfirmPass": confirmPass,
  };
}
