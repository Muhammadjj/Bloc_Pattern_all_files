class Phone {
  String? phone;
  String? website;

  Phone({this.phone, this.website});

  Phone.fromJson(Map<String, dynamic> map) {
    phone = map["phone"];
    website = map["website"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data["phone"] = phone;
    data["website"] = website;
    return data;
  }
}
