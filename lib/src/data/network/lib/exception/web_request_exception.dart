import 'package:flutterdatabase/src/data/network/lib/exception/network_error.dart';

class WebRequestException implements Exception {
  NetworkError error;

  WebRequestException(this.error);

  @override
  String toString() {
    return 'WebRequestException{error: $error}';
  }
}
