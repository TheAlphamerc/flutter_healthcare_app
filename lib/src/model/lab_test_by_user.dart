// To parse this JSON data, do
//
//     final labTestByUser = labTestByUserFromJson(jsonString);

import 'dart:convert';

List<LabTestByUser> labTestByUserFromJson(String str) => List<LabTestByUser>.from(json.decode(str).map((x) => LabTestByUser.fromJson(x)));

String labTestByUserToJson(List<LabTestByUser> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LabTestByUser {
  LabTestByUser({
    this.id,
    this.testid,
    this.testName,
    this.testcatid,
    this.catTestName,
    this.createby,
    this.createdAt,
    this.updateby,
    this.updatedate,
    this.testamount,
    this.testfor,
    this.samplecollectdate,
    this.samplecollecttime,
    this.paymenttype,
    this.status,
  });

  String id;
  String testid;
  String testName;
  String testcatid;
  String catTestName;
  dynamic createby;
  dynamic createdAt;
  dynamic updateby;
  dynamic updatedate;
  String testamount;
  String testfor;
  String samplecollectdate;
  String samplecollecttime;
  String paymenttype;
  String status;

  factory LabTestByUser.fromJson(Map<String, dynamic> json) => LabTestByUser(
    id: json["Id"],
    testid: json["Testid"],
    testName: json["TestName"],
    testcatid: json["Testcatid"],
    catTestName: json["CatTestName"],
    createby: json["Createby"],
    createdAt: json["CreatedAt"],
    updateby: json["Updateby"],
    updatedate: json["Updatedate"],
    testamount: json["Testamount"],
    testfor: json["Testfor"],
    samplecollectdate: json["Samplecollectdate"],
    samplecollecttime: json["Samplecollecttime"],
    paymenttype: json["Paymenttype"],
    status: json["Status"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Testid": testid,
    "TestName": testName,
    "Testcatid": testcatid,
    "CatTestName": catTestName,
    "Createby": createby,
    "CreatedAt": createdAt,
    "Updateby": updateby,
    "Updatedate": updatedate,
    "Testamount": testamount,
    "Testfor": testfor,
    "Samplecollectdate": samplecollectdate,
    "Samplecollecttime": samplecollecttime,
    "Paymenttype": paymenttype,
    "Status": status,
  };
}
