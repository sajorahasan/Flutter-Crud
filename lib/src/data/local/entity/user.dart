import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int id;
  String name;
  String email;
  String gender;
  @JsonKey(defaultValue: 0)
  int age;

  User({this.id, this.name, this.email, this.gender, this.age});

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, gender: $gender, age: $age}';
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
