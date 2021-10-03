import 'dart:convert';

OrderDetails orderDetailsFromJson(String str) => OrderDetails.fromJson(json.decode(str));

String orderDetailsToJson(OrderDetails data) => json.encode(data.toJson());

class OrderDetails {
  OrderDetails({
    this.orderId,
    this.orderForUser,
    this.orderStatus,
    this.orderDate,
    this.orderList,
  });

  String orderId;
  String orderForUser;
  String orderStatus;
  String orderDate;
  List<OrderList> orderList;

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
    orderId: json["orderId"],
    orderForUser: json["orderForUser"],
    orderStatus: json["orderStatus"],
    orderDate: json["orderDate"],
    orderList: List<OrderList>.from(json["OrderList"].map((x) => OrderList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "orderForUser": orderForUser,
    "orderStatus": orderStatus,
    "orderDate": orderDate,
    "OrderList": List<dynamic>.from(orderList.map((x) => x.toJson())),
  };
}

class OrderList {
  OrderList({
    this.id,
    this.productid,
    this.medicineName,
    this.productimageurl,
    this.productprice,
    this.productqnty,
  });

  String id;
  String productid;
  String medicineName;
  String productimageurl;
  String productprice;
  String productqnty;

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
    id: json["Id"],
    productid: json["Productid"],
    medicineName: json["MedicineName"],
    productimageurl: json["Productimageurl"],
    productprice: json["Productprice"],
    productqnty: json["Productqnty"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Productid": productid,
    "MedicineName": medicineName,
    "Productimageurl": productimageurl,
    "Productprice": productprice,
    "Productqnty": productqnty,
  };
}

enum MedicineName { ALPRAX, FINIX_20, NAPA }

final medicineNameValues = EnumValues({
  "Alprax": MedicineName.ALPRAX,
  "Finix 20": MedicineName.FINIX_20,
  "Napa": MedicineName.NAPA
});

enum Productimageurl { MEDICINE_PRODUCTS_ALPRAX_PNG, MEDICINE_PRODUCTS_FINIX_PNG, MEDICINE_PRODUCTS_NAPA_PNG }

final productimageurlValues = EnumValues({
  "/medicine/products/alprax.png": Productimageurl.MEDICINE_PRODUCTS_ALPRAX_PNG,
  "/medicine/products/finix.png": Productimageurl.MEDICINE_PRODUCTS_FINIX_PNG,
  "/medicine/products/napa.png": Productimageurl.MEDICINE_PRODUCTS_NAPA_PNG
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
