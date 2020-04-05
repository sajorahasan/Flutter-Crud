// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseEntity _$BaseEntityFromJson(Map<String, dynamic> json) {
  return BaseEntity(
    method: json['method'] as String,
    message: json['message'] as String,
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$BaseEntityToJson(BaseEntity instance) =>
    <String, dynamic>{
      'method': instance.method,
      'message': instance.message,
      'status': instance.status,
    };
