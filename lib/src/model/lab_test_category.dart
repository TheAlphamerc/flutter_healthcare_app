import 'dart:convert';

List<LabTestCategory> labTestCategoryFromJson(String str) => List<LabTestCategory>.from(json.decode(str).map((x) => LabTestCategory.fromJson(x)));

String labTestCategoryToJson(List<LabTestCategory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LabTestCategory {
  LabTestCategory({
    this.id,
    this.catid,
    this.cattesttype,
    this.cattestname,
    this.createby,
    this.createdAt,
    this.updateby,
    this.updatedate,
  });

  String id;
  String catid;
  String cattesttype;
  String cattestname;
  dynamic createby;
  dynamic createdAt;
  dynamic updateby;
  dynamic updatedate;

  factory LabTestCategory.fromJson(Map<String, dynamic> json) => LabTestCategory(
    id: json["Id"],
    catid: json["Catid"],
    cattesttype: json["Cattesttype"],
    cattestname: json["Cattestname"],
    createby: json["Createby"],
    createdAt: json["CreatedAt"],
    updateby: json["Updateby"],
    updatedate: json["Updatedate"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Catid": catid,
    "Cattesttype": cattesttype,
    "Cattestname": cattestname,
    "Createby": createby,
    "CreatedAt": createdAt,
    "Updateby": updateby,
    "Updatedate": updatedate,
  };
}
