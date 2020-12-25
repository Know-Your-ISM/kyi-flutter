// To parse this JSON data, do
//
//     final campus = campusFromJson(jsonString);

import 'dart:convert';

Campus campusFromJson(String str) => Campus.fromJson(json.decode(str));

String campusToJson(Campus data) => json.encode(data.toJson());

class Campus {
  Campus({
    this.count,
    this.locations,
    this.queryTime,
  });

  int count;
  List<Location> locations;
  int queryTime;

  factory Campus.fromJson(Map<String, dynamic> json) => Campus(
    count: json["count"] == null ? null : json["count"],
    locations: json["locations"] == null ? null : List<Location>.from(json["locations"].map((x) => Location.fromJson(x))),
    queryTime: json["_queryTime"] == null ? null : json["_queryTime"],
  );

  Map<String, dynamic> toJson() => {
    "count": count == null ? null : count,
    "locations": locations == null ? null : List<dynamic>.from(locations.map((x) => x.toJson())),
    "_queryTime": queryTime == null ? null : queryTime,
  };
}

class Location {
  Location({
    this.coordinates,
    this.photo,
    this.costs,
    this.propertyType,
    this.description,
    this.rating,
    this.id,
    this.name,
  });

  Coordinates coordinates;
  Photo photo;
  Costs costs;
  String propertyType;
  String description;
  String rating;
  String id;
  String name;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    coordinates: json["coordinates"] == null ? null : Coordinates.fromJson(json["coordinates"]),
    photo: json["photo"] == null ? null : Photo.fromJson(json["photo"]),
    costs: json["costs"] == null ? null : Costs.fromJson(json["costs"]),
    propertyType: json["propertyType"] == null ? null : json["propertyType"],
    description: json["description"] == null ? null : json["description"],
    rating: json["rating"] == null ? null : json["rating"],
    id: json["_id"] == null ? null : json["_id"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "coordinates": coordinates == null ? null : coordinates.toJson(),
    "photo": photo == null ? null : photo.toJson(),
    "costs": costs == null ? null : costs.toJson(),
    "propertyType": propertyType == null ? null : propertyType,
    "description": description == null ? null : description,
    "rating": rating == null ? null : rating,
    "_id": id == null ? null : id,
    "name": name == null ? null : name,
  };
}

class Coordinates {
  Coordinates({
    this.latitude,
    this.longitude,
    this.plusId,
  });

  String latitude;
  String longitude;
  String plusId;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    latitude: json["latitude"] == null ? null : json["latitude"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    plusId: json["plusID"] == null ? null : json["plusID"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "plusID": plusId == null ? null : plusId,
  };
}

class Costs {
  Costs({
    this.rickshaw,
    this.spending,
  });

  String rickshaw;
  String spending;

  factory Costs.fromJson(Map<String, dynamic> json) => Costs(
    rickshaw: json["rickshaw"] == null ? null : json["rickshaw"],
    spending: json["spending"] == null ? null : json["spending"],
  );

  Map<String, dynamic> toJson() => {
    "rickshaw": rickshaw == null ? null : rickshaw,
    "spending": spending == null ? null : spending,
  };
}

class Photo {
  Photo({
    this.big,
    this.medium,
    this.small,
    this.thumb,
  });

  String big;
  String medium;
  String small;
  String thumb;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    big: json["big"] == null ? null : json["big"],
    medium: json["medium"] == null ? null : json["medium"],
    small: json["small"] == null ? null : json["small"],
    thumb: json["thumb"] == null ? null : json["thumb"],
  );

  Map<String, dynamic> toJson() => {
    "big": big == null ? null : big,
    "medium": medium == null ? null : medium,
    "small": small == null ? null : small,
    "thumb": thumb == null ? null : thumb,
  };
}
