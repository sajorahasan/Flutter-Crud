import 'package:flutterdatabase/src/utils/hash_utils.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'base_entity.g.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.

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
