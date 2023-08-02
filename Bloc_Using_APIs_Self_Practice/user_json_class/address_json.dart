
import 'geo_json.dart';

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address(
      {this.street, this.suite, this.city, this.zipcode, this.geo,});

  // ** Json Decoder .
  Address.fromJson(Map<String, dynamic> map) {
    street = map["street"];
    suite = map["suite"];
    city = map["city"];
    zipcode = map["zipcode"];
    geo = Geo.fromJson(map["geo"]);
  }

// ** Json Encoder .
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data["street"] = street;
    data["suite"] = suite;
    data["city"] = city;
    data["zipcode"] = zipcode;
    data["geo"] = geo;
    return data;
  }
}
