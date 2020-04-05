import 'package:flutterdatabase/src/utils/hash_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_entity.g.dart';

@JsonSerializable()
class BaseEntity {
  String method;

  String message;

  int status;

  BaseEntity({
    this.method,
    this.message,
    this.status,
  });

  @override
  String toString() {
    return 'BaseEntity{method: $method, message: $message, status: $status}';
  }

  static BaseEntity parse(String jsonString) {
    Map baseMap = HashUtils.fromJson(jsonString);
    return BaseEntity.fromJson(baseMap);
  }

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory BaseEntity.fromJson(Map<String, dynamic> json) =>
      _$BaseEntityFromJson(json);
}
