import 'dart:convert';

List<Cart> cartFromJson(String str) => List<Cart>.from(json.decode(str).map((x) => Cart.fromJson(x)));

String cartToJson(List<Cart> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cart {
  Cart({
    this.id,
    this.productid,
    this.productname,
    this.productcategoryid,
    this.productcategoryname,
    this.productimageurl,
    this.productprice,
    this.productqnty,
    this.createdby,
    this.createdat,
    this.cartstatus,
  });

  String id;
  String productid;
  String productname;
  String productcategoryid;
  String productcategoryname;
  String productimageurl;
  String productprice;
  String productqnty;
  dynamic createdby;
  dynamic createdat;
  String cartstatus;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    id: json["Id"],
    productid: json["Productid"],
    productname: json["Productname"],
    productcategoryid: json["Productcategoryid"],
    productcategoryname: json["Productcategoryname"],
    productimageurl: json["Productimageurl"],
    productprice: json["Productprice"],
    productqnty: json["Productqnty"],
    createdby: json["Createdby"],
    createdat: json["Createdat"],
    cartstatus: json["Cartstatus"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Productid": productid,
    "Productname": productname,
    "Productcategoryid": productcategoryid,
    "Productcategoryname": productcategoryname,
    "Productimageurl": productimageurl,
    "Productprice": productprice,
    "Productqnty": productqnty,
    "Createdby": createdby,
    "Createdat": createdat,
    "Cartstatus": cartstatus,
  };
}
