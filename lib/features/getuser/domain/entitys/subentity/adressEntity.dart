class AddressEntity {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoEntity geo;

  AddressEntity(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
      required this.geo});
}

class GeoEntity {
  final String lat;
  final String lng;

  GeoEntity({
    required this.lat,
    required this.lng,
  });
}
