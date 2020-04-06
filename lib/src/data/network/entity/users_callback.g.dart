// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_callback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersCallback _$UsersCallbackFromJson(Map<String, dynamic> json) {
  return UsersCallback(
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : UserEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UsersCallbackToJson(UsersCallback instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return UserEntity(
    id: json['id'] as int,
    email: json['email'] as String,
    first_name: json['first_name'] as String,
    last_name: json['last_name'] as String,
    avatar: json['avatar'] as String,
  );
}

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'avatar': instance.avatar,
    };
