// To parse this JSON data, do
//
//     final categoryResponseModel = categoryResponseModelFromJson(jsonString);

import 'dart:convert';

CategoryResponseModel categoryResponseModelFromJson(String str) => CategoryResponseModel.fromJson(json.decode(str));

String categoryResponseModelToJson(CategoryResponseModel data) => json.encode(data.toJson());

class CategoryResponseModel {
  CategoryResponseModel({
    this.categoryDetails,
  });

  List<CategoryDetail>? categoryDetails;

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) => CategoryResponseModel(
    categoryDetails: json["CategoryDetails"] == null ? [] : List<CategoryDetail>.from(json["CategoryDetails"]!.map((x) => CategoryDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "CategoryDetails": categoryDetails == null ? [] : List<dynamic>.from(categoryDetails!.map((x) => x.toJson())),
  };
}

class CategoryDetail {
  CategoryDetail({
    this.category,
    this.categoryImage,
    this.id,
    this.multipleshop,
  });

  String? category;
  String? categoryImage;
  int? id;
  List<Multipleshop>? multipleshop;

  factory CategoryDetail.fromJson(Map<String, dynamic> json) => CategoryDetail(
    category: json["category"],
    categoryImage: json["categoryImage"],
    id: json["id"],
    multipleshop: json["multipleshop"] == null ? [] : List<Multipleshop>.from(json["multipleshop"]!.map((x) => Multipleshop.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "categoryImage": categoryImage,
    "id": id,
    "multipleshop": multipleshop == null ? [] : List<dynamic>.from(multipleshop!.map((x) => x.toJson())),
  };
}

class Multipleshop {
  Multipleshop({
    this.id,
    this.multiplePhotos,
    this.wearDispriction,
    this.wearPrice,
    this.wearReview,
    this.wearimg,
    this.wearname,
  });

  int? id;
  List<String>? multiplePhotos;
  String? wearDispriction;
  String? wearPrice;
  double? wearReview;
  String? wearimg;
  String? wearname;

  factory Multipleshop.fromJson(Map<String, dynamic> json) => Multipleshop(
    id: json["id"],
    multiplePhotos: json["multiple_photos"] == null ? [] : List<String>.from(json["multiple_photos"]!.map((x) => x)),
    wearDispriction: json["wear_dispriction"],
    wearPrice: json["wear_price"],
    wearReview: json["wear_review"]?.toDouble(),
    wearimg: json["wearimg"],
    wearname: json["wearname"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "multiple_photos": multiplePhotos == null ? [] : List<dynamic>.from(multiplePhotos!.map((x) => x)),
    "wear_dispriction": wearDispriction,
    "wear_price": wearPrice,
    "wear_review": wearReview,
    "wearimg": wearimg,
    "wearname": wearname,
  };
}
