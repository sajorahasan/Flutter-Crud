import 'package:flutterdatabase/src/data/network/lib/exception/network_error.dart';

class NetworkStackResponse {
  /// HTTP status code
  int status;

  /// It indicate not Error while executing request. There might be failure in json response.
  bool success;

  /// HTTP response
  String result;

  /// HTTP response headers
  Map<String, String> headers;

  /// HTTP Error Status
  NetworkError error;

  NetworkStackResponse(this.status, this.result,
      {this.success, this.headers, this.error});

  @override
  String toString() {
    return 'NetworkStackResponse{status: $status, success: $success, result: $result, headers: $headers, error: $error}';
  }
}
