// To parse this JSON data, do
//
//     final drugItemModel = drugItemModelFromJson(jsonString);

import 'dart:convert';

DrugItemModel drugItemModelFromJson(String str) => DrugItemModel.fromJson(json.decode(str));

String drugItemModelToJson(DrugItemModel data) => json.encode(data.toJson());

class DrugItemModel {
  DrugItemModel({
    this.drugs,
  });

  List<Drug> drugs;

  factory DrugItemModel.fromJson(Map<String, dynamic> json) => DrugItemModel(
    drugs: json["drugs"] == null ? null : List<Drug>.from(json["drugs"].map((x) => Drug.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "drugs": drugs == null ? null : List<dynamic>.from(drugs.map((x) => x.toJson())),
  };
}

class Drug {
  Drug({
    this.id,
    this.nameen,
    this.price,
    this.stock,
    this.expire,
    this.code,
    this.totnetcoast,
    this.totprice,
  });

  String id;
  String nameen;
  String price;
  String stock;
  String expire;
  String code;
  String totnetcoast;
  String totprice;

  factory Drug.fromJson(Map<String, dynamic> json) => Drug(
    id: json["id"] == null ? null : json["id"],
    nameen: json["nameen"] == null ? null : json["nameen"],
    price: json["price"] == null ? null : json["price"],
    stock: json["stock"] == null ? null : json["stock"],
    expire: json["expire"] == null ? null : json["expire"],
    code: json["code"] == null ? null : json["code"],
    totnetcoast: json["totnetcoast"] == null ? null : json["totnetcoast"],
    totprice: json["totprice"] == null ? null : json["totprice"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "nameen": nameen == null ? null : nameen,
    "price": price == null ? null : price,
    "stock": stock == null ? null : stock,
    "expire": expire == null ? null : expire,
    "code": code == null ? null : code,
    "totnetcoast": totnetcoast == null ? null : totnetcoast,
    "totprice": totprice == null ? null : totprice,
  };
}
