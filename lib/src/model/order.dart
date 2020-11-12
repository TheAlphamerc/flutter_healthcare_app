// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

List<Order> orderFromJson(String str) => List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  Order({
    this.id,
    this.orderid,
    this.productid,
    this.productname,
    this.productqnty,
    this.productprice,
    this.orderstatus,
    this.orderforuser,
    this.orderdate,
    this.updateby,
    this.updateat,
    this.imgurl,
  });

  String id;
  String orderid;
  dynamic productid;
  dynamic productname;
  dynamic productqnty;
  dynamic productprice;
  dynamic orderstatus;
  dynamic orderforuser;
  String orderdate;
  dynamic updateby;
  dynamic updateat;
  dynamic imgurl;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["Id"],
    orderid: json["Orderid"],
    productid: json["Productid"],
    productname: json["Productname"],
    productqnty: json["Productqnty"],
    productprice: json["Productprice"],
    orderstatus: json["Orderstatus"],
    orderforuser: json["Orderforuser"],
    orderdate: json["Orderdate"],
    updateby: json["Updateby"],
    updateat: json["Updateat"],
    imgurl: json["Imgurl"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Orderid": orderid,
    "Productid": productid,
    "Productname": productname,
    "Productqnty": productqnty,
    "Productprice": productprice,
    "Orderstatus": orderstatus,
    "Orderforuser": orderforuser,
    "Orderdate": orderdateValues.reverse[orderdate],
    "Updateby": updateby,
    "Updateat": updateat,
    "Imgurl": imgurl,
  };
}

enum Orderdate { THE_31102020, THE_01112020 }

final orderdateValues = EnumValues({
  "01-11-2020": Orderdate.THE_01112020,
  "31-10-2020": Orderdate.THE_31102020
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
