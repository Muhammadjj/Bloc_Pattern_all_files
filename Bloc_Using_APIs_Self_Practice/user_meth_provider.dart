import 'dart:convert';

import 'package:bloc_pattern_in_flutter/Screens/Bloc_Using_APIs_Self_Practice/user_json_class/user_json.dart';
import 'package:http/http.dart' as http;

abstract class UserApiProvider {
  String get baseURL => "https://jsonplaceholder.typicode.com";
  String get apiURL;

  jsonFetchingData({String endPoint = ""}) async {
    var response = await http.get(Uri.parse(baseURL + apiURL + endPoint));
    if (response.statusCode == 200) {
      // print(response.body);
      print(response.statusCode);
      return jsonDecode(response.body.toString());
    } else {
      throw Exception("Data Don't Fetch Please Try Again .");
    }
  }
}

class ApiMethod extends UserApiProvider {
  @override
  String get apiURL => "/users";

  Future<List<UsersJsonParentFiles>> fetch() async {
    List listMap = await jsonFetchingData();
    print(
        "${listMap.toString()} Jawad Jani -------------------<<<<<?>>>>-------?????");
    return listMap.map((data) => UsersJsonParentFiles.fromJson(data)).toList();
  }
}
