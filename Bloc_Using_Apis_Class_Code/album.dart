// import 'dart:convert';

class Album {
  int? id;
  int? userId;
  String? title;
  Album({
    required this.id,
    required this.userId,
    required this.title,
  });

  // ** Json Decoded => mean ka (Json Convert to map and map covert to Dart Object).
  Album.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    userId = map["userId"];
    title = map["title"];
  }

  // ** Json Encode  => mean ka (Dart Object Convert to map and map covert to Json).
  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["userId"] = userId;
    data["title"] = title;
    return data;
  }
  // Album copyWith({
  //   int? id,
  //   int? userId,
  //   String? title,
  // }) {
  //   return Album(
  //     id: id ?? this.id,
  //     userId: userId ?? this.userId,
  //     title: title ?? this.title,
  //   );
  // }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'userId': userId,
  //     'title': title,
  //   };
  // }

  // factory Album.fromMap(Map<String, dynamic> map) {
  //   return Album(
  //     id: map['id'] as int,
  //     userId: map['userId'] as int,
  //     title: map['title'] as String,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory Album.fromJson(String source) =>
  //     Album.fromMap(json.decode(source) as Map<String, dynamic>);

  // @override
  // String toString() => 'Album(id: $id, userId: $userId, title: $title)';

  // @override
  // bool operator ==(covariant Album other) {
  //   if (identical(this, other)) return true;

  //   return other.id == id && other.userId == userId && other.title == title;
  // }

  // @override
  // int get hashCode => id.hashCode ^ userId.hashCode ^ title.hashCode;
}
