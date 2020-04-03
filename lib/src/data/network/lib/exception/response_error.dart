import 'package:flutterdatabase/src/data/network/lib/stack/network_stack_response.dart';

class ResponseError implements Exception {
  final NetworkStackResponse response;

  const ResponseError({this.response});

  @override
  String toString() {
    return 'ResponseError{error: $response}';
  }
}
