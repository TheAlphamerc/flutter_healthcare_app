import 'dart:convert';

List<LabTestByCategory> labTestByCategoryFromJson(String str) => List<LabTestByCategory>.from(json.decode(str).map((x) => LabTestByCategory.fromJson(x)));

String labTestByCategoryToJson(List<LabTestByCategory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LabTestByCategory {
  LabTestByCategory({
    this.id,
    this.testid,
    this.testname,
    this.testamount,
    this.teststatus,
    this.testcategory,
    this.createby,
    this.createdAt,
    this.updateby,
    this.updatedate,
    this.catTestName,
  });

  String id;
  String testid;
  String testname;
  String testamount;
  dynamic teststatus;
  String testcategory;
  dynamic createby;
  dynamic createdAt;
  dynamic updateby;
  dynamic updatedate;
  String catTestName;

  factory LabTestByCategory.fromJson(Map<String, dynamic> json) => LabTestByCategory(
    id: json["Id"],
    testid: json["Testid"],
    testname: json["Testname"],
    testamount: json["Testamount"],
    teststatus: json["Teststatus"],
    testcategory: json["Testcategory"],
    createby: json["Createby"],
    createdAt: json["CreatedAt"],
    updateby: json["Updateby"],
    updatedate: json["Updatedate"],
    catTestName: json["catTestName"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Testid": testid,
    "Testname": testname,
    "Testamount": testamount,
    "Teststatus": teststatus,
    "Testcategory": testcategory,
    "Createby": createby,
    "CreatedAt": createdAt,
    "Updateby": updateby,
    "Updatedate": updatedate,
    "catTestName": catTestName,
  };
}
