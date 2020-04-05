import 'package:json_annotation/json_annotation.dart';

part 'users_callback.g.dart';

@JsonSerializable()
class UsersCallback {
  List<UserEntity> data;

  UsersCallback({this.data});

  @override
  String toString() {
    return 'UsersCallback{data: $data}';
  }

  factory UsersCallback.fromJson(Map<String, dynamic> json) =>
      _$UsersCallbackFromJson(json);

  Map<String, dynamic> toJson() => _$UsersCallbackToJson(this);
}

@JsonSerializable()
class UserEntity {
  int id;
  String email;
  String first_name;
  String last_name;
  String avatar;

  UserEntity(
      {this.id, this.email, this.first_name, this.last_name, this.avatar});

  @override
  String toString() {
    return 'UserEntity{id: $id, email: $email, first_name: $first_name, last_name: $last_name, avatar: $avatar}';
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
