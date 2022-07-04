// To parse this JSON data, do
//
// final welcome = welcomeFromJson(jsonString);
import 'dart:convert';

Facebook facebookFromJson(String str) => Facebook.fromJson(json.decode(str));

String facebookToJson(Facebook data) => json.encode(data.toJson());

class Facebook {
  Facebook({
    required this.status,
    required this.dataInfo,
  });

  int? status;
  List<DataInfo> dataInfo;

  factory Facebook.fromJson(Map<String, dynamic> json) => Facebook(
        status: json["status"],
        dataInfo: List<DataInfo>.from(
            json["data"].map((x) => DataInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "dataInfo": List<dynamic>.from(dataInfo.map((x) => x.toJson())),
      };
}

class DataInfo {
  DataInfo({
    required this.id,
    required this.title,
    required this.description,
    required this.address,
    required this.postcode,
    required this.phoneNumber,
    required this.latitude,
    required this.longitude,
    required this.image,
  });

  int? id;
  String? title;
  String? description;
  String? address;
  String? postcode;
  String? phoneNumber;
  String? latitude;
  String? longitude;
  Images? image;

  factory DataInfo.fromJson(Map<String, dynamic> json) => DataInfo(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        address: json["address"],
        postcode: json["postcode"],
        phoneNumber: json["phoneNumber"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        image: Images.fromJson(json["image"]),
      );
  Map<String, dynamic> toJson() => {
        "author": id,
        "title": title,
        "description": description,
        "url": address,
        "urlToImage": postcode,
        "publishedAt": phoneNumber,
      };
}

class Images {
  String? small;
  String? medium;
  String? large;

  Images({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
        "large": large,
      };
}
