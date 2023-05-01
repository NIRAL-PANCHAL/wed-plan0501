// To parse this JSON data, do
//
//     final hotelsResponseModel = hotelsResponseModelFromJson(jsonString);

import 'dart:convert';

HotelsResponseModel hotelsResponseModelFromJson(String str) => HotelsResponseModel.fromJson(json.decode(str));

String hotelsResponseModelToJson(HotelsResponseModel data) => json.encode(data.toJson());

class HotelsResponseModel {
  HotelsResponseModel({
    this.data,
  });

  List<Datum>? data;

  factory HotelsResponseModel.fromJson(Map<String, dynamic> json) => HotelsResponseModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.address,
    this.hotelImage,
    this.hotelname,
    this.latitude,
    this.longitude,
    this.price,
    this.id,
  });

  String? address;
  String? hotelImage;
  String? hotelname;
  double? latitude;
  double? longitude;
  String? price;
  int? id;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    address: json["Address"],
    hotelImage: json["HotelImage"],
    hotelname: json["Hotelname"],
    latitude: json["Latitude"]?.toDouble(),
    longitude: json["Longitude"]?.toDouble(),
    price: json["Price"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "Address": address,
    "HotelImage": hotelImage,
    "Hotelname": hotelname,
    "Latitude": latitude,
    "Longitude": longitude,
    "Price": price,
    "id": id,
  };
}
