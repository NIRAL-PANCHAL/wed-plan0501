// To parse this JSON data, do
//
//     final orderListResponseModel = orderListResponseModelFromJson(jsonString);

import 'dart:convert';

OrderListResponseModel orderListResponseModelFromJson(String str) => OrderListResponseModel.fromJson(json.decode(str));

String orderListResponseModelToJson(OrderListResponseModel data) => json.encode(data.toJson());

class OrderListResponseModel {
  OrderListResponseModel({
    this.data,
  });

  List<Datum>? data;

  factory OrderListResponseModel.fromJson(Map<String, dynamic> json) => OrderListResponseModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.category,
    this.description,
    this.id,
    this.image,
    this.price,
    this.rating,
    this.title,
  });

  Category? category;
  String? description;
  int? id;
  String? image;
  String? price;
  Rating? rating;
  String? title;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    category: categoryValues.map[json["category"]]!,
    description: json["description"],
    id: json["id"],
    image: json["image"],
    price: json["price"],
    rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "category": categoryValues.reverse[category],
    "description": description,
    "id": id,
    "image": image,
    "price": price,
    "rating": rating?.toJson(),
    "title": title,
  };
}

enum Category { JEWELERY, MEN_S_CLOTHING, ELECTRONICS, WOMEN_S_CLOTHING }

final categoryValues = EnumValues({
  "electronics": Category.ELECTRONICS,
  "jewelery": Category.JEWELERY,
  "men's clothing": Category.MEN_S_CLOTHING,
  "women's clothing": Category.WOMEN_S_CLOTHING
});

class Rating {
  Rating({
    this.count,
    this.rate,
  });

  int? count;
  double? rate;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    count: json["count"],
    rate: json["rate"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "rate": rate,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
