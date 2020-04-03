import 'package:flutterdatabase/src/data/local/dao/user_dao.dart';
import 'package:flutterdatabase/src/utils/hash_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int id;
  String name;
  String email;
  String gender;
  int age;

  User({this.id, this.name, this.email, this.gender, this.age});

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, gender: $gender, age: $age}';
  }

  factory User.fromJson(String jsonString) {
    Map baseMap = HashUtils.fromJson(jsonString);
    return _$UserFromJson(baseMap);
  }

  factory User.parseJson(Map baseMap) {
    return _$UserFromJson(baseMap);
  }

  Map<String, dynamic> toMap() => _$toMap(this);

  static User fromMap(Map<String, dynamic> map) => _$fromMap(map);
}
