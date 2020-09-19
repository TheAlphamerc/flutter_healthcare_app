import 'dart:convert';

List<Medicine> medicineFromJson(String str) => List<Medicine>.from(json.decode(str).map((x) => Medicine.fromJson(x)));

String medicineToJson(List<Medicine> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Medicine {
  Medicine({
    this.id,
    this.medicineName,
    this.companyName,
    this.price,
    this.genericName,
    this.image,
  });

  String id;
  String medicineName;
  String companyName;
  String price;
  String genericName;
  String image;

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
    id: json["id"],
    medicineName: json["medicineName"],
    companyName: json["companyName"],
    price: json["price"],
    genericName: json["genericName"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "medicineName": medicineName,
    "companyName": companyName,
    "price": price,
    "genericName": genericName,
    "image": image,
  };
}
