// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

List<LoginResponse> loginResponseFromJson(String str) =>
    List<LoginResponse>.from(
        json.decode(str).map((x) => LoginResponse.fromJson(x)));

String loginResponseToJson(List<LoginResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
  String logname;
  String logpass;
  String securPass;
  String email;
  String firstName;
  String lastName;
  String username;
  String userphone;
  String gender;
  String userdob;
  String address;
  String usertype;
  String userid;
  String roleid;
  bool isactive;
  String createdby;
  String createdtime;
  String updatedby;
  String updatedtime;
  String lastlogin;
  String queryFlag;
  String confirmPass;

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

  factory LoginResponse.patient() {
    return LoginResponse(
      id: "1233asdf",
      logname: "John Doe",
      logpass: "Logpass",
      securPass: "SecurePass",
      email: "john.doe@gmail.com",
      firstName: "John",
      lastName: "Doe",
      username: "johndoe",
      userphone: "9876543210",
      address: "Address",
      usertype: "Patient",
      userid: "Userid",
      roleid: "Roleid",
      gender: "Male",
      isactive: true,
      createdby: "John Doe",
      createdtime: DateTime.now().add(Duration(days: -365)).toString(),
      updatedby: "Updatedby",
      updatedtime: DateTime.now().add(Duration(days: -35)).toString(),
      lastlogin: DateTime.now().add(Duration(days: -30)).toString(),
      queryFlag: "QueryFlag",
      confirmPass: "ConfirmPass",
    );
  }
}
