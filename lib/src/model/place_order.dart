// To parse this JSON data, do
//
//     final placeOrder = placeOrderFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_healthcare_app/src/model/cart.dart';

PlaceOrder placeOrderFromJson(String str) => PlaceOrder.fromJson(json.decode(str));

String placeOrderToJson(PlaceOrder data) => json.encode(data.toJson());

class PlaceOrder {
  PlaceOrder({
    this.userId,
    this.productList,
  });

  String userId;
  List<Cart> productList;

  factory PlaceOrder.fromJson(Map<String, dynamic> json) => PlaceOrder(
    userId: json["userId"],
    productList: List<Cart>.from(json["productList"].map((x) => Cart.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "productList": List<dynamic>.from(productList.map((x) => x.toJson())),
  };
}


