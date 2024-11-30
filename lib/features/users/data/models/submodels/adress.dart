import '../../../domain/entity/sub_entity/address_entuty.dart';
import 'geo.dart';

class Address extends AddressEntity {
  Address({
    required String street,
    required String suite,
    required String city,
    required String zipcode,
    required Geo geo,
  }) : super(
    street: street,
    suite: suite,
    city: city,
    zipcode: zipcode,
    geo: geo,
  );

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: Geo.fromJson(json['geo']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': (geo as Geo).toJson(),
    };
  }
}
