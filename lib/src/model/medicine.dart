// To parse this JSON data, do
//
//     final medicine = medicineFromJson(jsonString);

import 'dart:convert';

List<Medicine> medicineFromJson(String str) => List<Medicine>.from(json.decode(str).map((x) => Medicine.fromJson(x)));

String medicineToJson(List<Medicine> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Medicine {
  Medicine({
    this.id,
    this.medicinename,
    this.medicinecompany,
    this.medicinetype,
    this.medicinetypename,
    this.productcategory,
    this.productcategoryname,
    this.medicineprice,
    this.medicineimage,
    this.uom,
    this.stockqnty,
    this.createdby,
    this.createdat,
    this.updateby,
    this.updatedat,
    this.status,
    this.queryFlag,
    this.imageUrl,
    this.medicineDesc,
  });

  String id;
  String medicinename;
  String medicinecompany;
  String medicinetype;
  String medicinetypename;
  String productcategory;
  String productcategoryname;
  String medicineprice;
  String medicineimage;
  String uom;
  String stockqnty;
  dynamic createdby;
  dynamic createdat;
  dynamic updateby;
  dynamic updatedat;
  dynamic status;
  dynamic queryFlag;
  String imageUrl;
  String medicineDesc;

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
    id: json["Id"],
    medicinename: json["Medicinename"],
    medicinecompany: json["Medicinecompany"],
    medicinetype: json["Medicinetype"],
    medicinetypename: json["Medicinetypename"],
    productcategory: json["Productcategory"],
    productcategoryname: json["Productcategoryname"],
    medicineprice: json["Medicineprice"],
    medicineimage: json["Medicineimage"],
    uom: json["Uom"],
    stockqnty: json["Stockqnty"],
    createdby: json["Createdby"],
    createdat: json["Createdat"],
    updateby: json["Updateby"],
    updatedat: json["Updatedat"],
    status: json["Status"],
    queryFlag: json["QueryFlag"],
    imageUrl: json["ImageUrl"],
    medicineDesc: json["MedicineDesc"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Medicinename": medicinename,
    "Medicinecompany": medicinecompany,
    "Medicinetype": medicinetype,
    "Medicinetypename": medicinetypename,
    "Productcategory": productcategory,
    "Productcategoryname": productcategoryname,
    "Medicineprice": medicineprice,
    "Medicineimage": medicineimage,
    "Uom": uom,
    "Stockqnty": stockqnty,
    "Createdby": createdby,
    "Createdat": createdat,
    "Updateby": updateby,
    "Updatedat": updatedat,
    "Status": status,
    "QueryFlag": queryFlag,
    "ImageUrl": imageUrl,
    "MedicineDesc": medicineDesc,
  };
}
