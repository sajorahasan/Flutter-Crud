// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    documentId: json['documentId'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    gender: json['gender'] as String,
    age: json['age'] as int ?? 0,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'documentId': instance.documentId,
      'name': instance.name,
      'email': instance.email,
      'gender': instance.gender,
      'age': instance.age,
    };
