import 'package:bloc_pattern_in_flutter/Screens/Bloc_Using_APIs_Self_Practice/user_json_class/address_json.dart';

class UsersJsonParentFiles {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;

  UsersJsonParentFiles({this.id, this.name, this.username, this.email, this.address});

  // ** Json Decoder.
  UsersJsonParentFiles.fromJson(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    username = map["username"];
    email = map["email"];
    address = Address.fromJson(map["address"]);
  }


  // ** Json Encoder.
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["username"] = username;
    data["email"] = email;
    data["address"] = address;
    return data;
  }
}
