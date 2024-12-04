

import '../../../domain/entitys/subentity/adressEntity.dart';

class Geo extends GeoEntity {
  Geo({
    required super.lat,
    required super.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'],
      lng: json['lng'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
}