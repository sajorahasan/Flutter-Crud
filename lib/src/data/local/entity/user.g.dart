// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
    gender: json['gender'] as String,
    age: json['age'] as int,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'gender': instance.gender,
      'age': instance.age,
    };

Map<String, dynamic> _$toMap(User user) {
  Map<String, dynamic> map = new Map();

  map[UserDao.ID] = user.id;
  map[UserDao.NAME] = user.name;
  map[UserDao.EMAIL] = user.email;
  map[UserDao.GENDER] = user.gender;
  map[UserDao.AGE] = user.age;
  return map;
}

User _$fromMap(Map<String, dynamic> map) {
  User contact = User(
      id: map[UserDao.ID],
      name: map[UserDao.NAME],
      email: map[UserDao.EMAIL],
      gender: map[UserDao.GENDER],
      age: map[UserDao.AGE]);

  return contact;
}
