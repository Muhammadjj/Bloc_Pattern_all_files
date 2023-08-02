
class Geo {
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

  Geo.fromJson(Map<String, dynamic> map) {
    lat = map["lat"];
    lng = map["lng"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data["lat"] = lat;
    data["lng"] = lng;
    return data;
  }
}
