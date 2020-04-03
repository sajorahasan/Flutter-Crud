import 'dart:convert';

class HashUtils {
  static String toBase64(String text) {
    var bytes = utf8.encode(text);
    String encoded = base64.encode(bytes);
    return encoded;
  }

  static String toJson(Object value) {
    String encoded = json.encode(value);
    return encoded;
  }

  static Map fromJson(String jsonString) {
    return json.decode(jsonString);
  }

  static List fromJsonAsList(String jsonString) {
    return json.decode(jsonString);
  }
}
