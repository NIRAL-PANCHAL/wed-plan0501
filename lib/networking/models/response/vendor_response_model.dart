// To parse this JSON data, do
//
//     final vendorsResponseModel = vendorsResponseModelFromJson(jsonString);

import 'dart:convert';

VendorsResponseModel vendorsResponseModelFromJson(String str) => VendorsResponseModel.fromJson(json.decode(str));

String vendorsResponseModelToJson(VendorsResponseModel data) => json.encode(data.toJson());

class VendorsResponseModel {
  VendorsResponseModel({
    this.data,
  });

  List<VendorDatas>? data;

  factory VendorsResponseModel.fromJson(Map<String, dynamic> json) => VendorsResponseModel(
    data: json["data"] == null ? [] : List<VendorDatas>.from(json["data"]!.map((x) => VendorDatas.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class VendorDatas {
  VendorDatas({
    this.id,
    this.vendorDispriction,
    this.vendorImg,
    this.vendorname,
    this.vendorsDetail,
  });

  int? id;
  String? vendorDispriction;
  String? vendorImg;
  String? vendorname;
  List<VendorsDetail>? vendorsDetail;

  factory VendorDatas.fromJson(Map<String, dynamic> json) => VendorDatas(
    id: json["id"],
    vendorDispriction: json["vendor_dispriction"],
    vendorImg: json["vendor_img"],
    vendorname: json["vendorname"],
    vendorsDetail: json["vendors_detail"] == null ? [] : List<VendorsDetail>.from(json["vendors_detail"]!.map((x) => VendorsDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vendor_dispriction": vendorDispriction,
    "vendor_img": vendorImg,
    "vendorname": vendorname,
    "vendors_detail": vendorsDetail == null ? [] : List<dynamic>.from(vendorsDetail!.map((x) => x.toJson())),
  };
}

class VendorsDetail {
  VendorsDetail({
    this.address,
    this.latitude,
    this.longitude,
    this.hotelImage,
    this.hotelname,
    this.price,
    this.id,
  });

  String? address;
  double? latitude;
  double? longitude;
  String? hotelImage;
  String? hotelname;
  String? price;
  int? id;

  factory VendorsDetail.fromJson(Map<String, dynamic> json) => VendorsDetail(
    address:  json["Address"],
    latitude: json["Latitude"]?.toDouble(),
    longitude: json["Longitude"]?.toDouble(),
    hotelImage: json["HotelImage"],
    hotelname: json["Hotelname"],
    price: json["Price"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "Address": addressValues.reverse[address],
    "HotelImage": hotelImage,
    "Hotelname": hotelnameValues.reverse[hotelname],
    "Price": priceValues.reverse[price],
    "id": id,
  };
}

enum Address { PICHOLA_UDAIPUR_RAJASTHAN, BADI_GORELA_MULLA_TALAI_RD_PICHOLA_UDAIPUR_RAJASTHAN, APOLLO_BUNDER_ROAD_NEAR_GATE_WAY_OF_INDIA_MUMBAI_MAHARASHTRA, DIPLOMATIC_ENCLAVE_SADAR_PATEL_MARG_NEW_DELHI_DELHI }

final addressValues = EnumValues({
  "Apollo Bunder Road, Near Gate Way Of India, Mumbai, Maharashtra": Address.APOLLO_BUNDER_ROAD_NEAR_GATE_WAY_OF_INDIA_MUMBAI_MAHARASHTRA,
  "Badi-Gorela-Mulla Talai Rd, Pichola, Udaipur, Rajasthan": Address.BADI_GORELA_MULLA_TALAI_RD_PICHOLA_UDAIPUR_RAJASTHAN,
  "Diplomatic Enclave, Sadar Patel Marg, New Delhi, Delhi": Address.DIPLOMATIC_ENCLAVE_SADAR_PATEL_MARG_NEW_DELHI_DELHI,
  "Pichola, Udaipur, Rajasthan": Address.PICHOLA_UDAIPUR_RAJASTHAN
});

enum Hotelname { TAJ_LAKE_PALACE, THE_OBEROI_UDAIVILAS, THE_TAJ_MAHAL_PALACE, ITC_MAURYA }

final hotelnameValues = EnumValues({
  "ITC Maurya": Hotelname.ITC_MAURYA,
  "Taj Lake Palace": Hotelname.TAJ_LAKE_PALACE,
  "The Oberoi Udaivilas": Hotelname.THE_OBEROI_UDAIVILAS,
  "The Taj Mahal Palace": Hotelname.THE_TAJ_MAHAL_PALACE
});

enum Price { THE_68999_ONWARDS, THE_45999_ONWARDS, THE_79999_ONWARDS, THE_65999_ONWARDS }

final priceValues = EnumValues({
  "₹45999/- onwards": Price.THE_45999_ONWARDS,
  "₹65999/- onwards": Price.THE_65999_ONWARDS,
  "₹68999/- onwards": Price.THE_68999_ONWARDS,
  "₹79999/- onwards": Price.THE_79999_ONWARDS
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
