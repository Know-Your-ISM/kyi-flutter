// To parse this JSON data, do
//
//     final restaurant = restaurantFromJson(jsonString);

import 'dart:convert';

Restaurant restaurantFromJson(String str) => Restaurant.fromJson(json.decode(str));

String restaurantToJson(Restaurant data) => json.encode(data.toJson());

class Restaurant {
  Restaurant({
    this.count,
    this.restaurantlocations,
    this.queryTime,
  });

  int count;
  List<RestaurantLocation> restaurantlocations;
  int queryTime;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    count: json["count"] == null ? null : json["count"],
    restaurantlocations: json["locations"] == null ? null : List<RestaurantLocation>.from(json["locations"].map((x) => RestaurantLocation.fromJson(x))),
    queryTime: json["_queryTime"] == null ? null : json["_queryTime"],
  );

  Map<String, dynamic> toJson() => {
    "count": count == null ? null : count,
    "locations": restaurantlocations == null ? null : List<dynamic>.from(restaurantlocations.map((x) => x.toJson())),
    "_queryTime": queryTime == null ? null : queryTime,
  };
}

class RestaurantLocation {
  RestaurantLocation({
    this.coordinates,
    this.photo,
    this.rating,
    this.costs,
    this.propertyType,
    this.description,
    this.events,
    this.alcohol,
    this.id,
    this.name,
  });

  Coordinates coordinates;
  Photo photo;
  Rating rating;
  Costs costs;
  String propertyType;
  String description;
  String events;
  String alcohol;
  String id;
  String name;

  factory RestaurantLocation.fromJson(Map<String, dynamic> json) => RestaurantLocation(
    coordinates: json["coordinates"] == null ? null : Coordinates.fromJson(json["coordinates"]),
    photo: json["photo"] == null ? null : Photo.fromJson(json["photo"]),
    rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
    costs: json["costs"] == null ? null : Costs.fromJson(json["costs"]),
    propertyType: json["propertyType"] == null ? null : json["propertyType"],
    description: json["description"] == null ? null : json["description"],
    events: json["events"] == null ? null : json["events"],
    alcohol: json["alcohol"] == null ? null : json["alcohol"],
    id: json["_id"] == null ? null : json["_id"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "coordinates": coordinates == null ? null : coordinates.toJson(),
    "photo": photo == null ? null : photo.toJson(),
    "rating": rating == null ? null : rating.toJson(),
    "costs": costs == null ? null : costs.toJson(),
    "propertyType": propertyType == null ? null : propertyType,
    "description": description == null ? null : description,
    "events": events == null ? null : events,
    "alcohol": alcohol == null ? null : alcohol,
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
    this.spending,
    this.rickshaw,
  });

  Spending spending;
  dynamic rickshaw;

  factory Costs.fromJson(Map<String, dynamic> json) => Costs(
    spending: json["spending"] == null ? null : Spending.fromJson(json["spending"]),
    rickshaw: json["rickshaw"] == null ? null : json["rickshaw"],
  );

  Map<String, dynamic> toJson() => {
    "spending": spending == null ? null : spending.toJson(),
    "rickshaw": rickshaw == null ? null : rickshaw,
  };
}

class Spending {
  Spending({
    this.for2,
    this.for4,
    this.for6,
  });

  dynamic for2;
  dynamic for4;
  dynamic for6;

  factory Spending.fromJson(Map<String, dynamic> json) => Spending(
    for2: json["for2"] == null ? null : json["for2"],
    for4: json["for4"] == null ? null : json["for4"],
    for6: json["for6"] == null ? null : json["for6"],
  );

  Map<String, dynamic> toJson() => {
    "for2": for2 == null ? null : for2,
    "for4": for4 == null ? null : for4,
    "for6": for6 == null ? null : for6,
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

class Rating {
  Rating({
    this.ambience,
    this.service,
    this.food,
  });

  dynamic ambience;
  dynamic service;
  dynamic food;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    ambience: json["ambience"] == null ? null : json["ambience"],
    service: json["service"] == null ? null : json["service"],
    food: json["food"] == null ? null : json["food"],
  );

  Map<String, dynamic> toJson() => {
    "ambience": ambience == null ? null : ambience,
    "service": service == null ? null : service,
    "food": food == null ? null : food,
  };
}
