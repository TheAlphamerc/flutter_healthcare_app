import 'dart:convert';

List<MedicineType> medicineTypeFromJson(String str) => List<MedicineType>.from(json.decode(str).map((x) => MedicineType.fromJson(x)));

String medicineTypeToJson(List<MedicineType> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MedicineType {
  MedicineType({
    this.id,
    this.medicinetypename,
    this.status,
  });

  String id;
  String medicinetypename;
  String status;

  factory MedicineType.fromJson(Map<String, dynamic> json) => MedicineType(
    id: json["Id"],
    medicinetypename: json["Medicinetypename"],
    status: json["Status"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Medicinetypename": medicinetypename,
    "Status": status,
  };
}
