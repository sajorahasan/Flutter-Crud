import 'dart:convert';
import 'dart:io';

import 'package:flutterdatabase/src/data/network/lib/handler/web_request_builder.dart';
import 'package:flutterdatabase/src/data/network/lib/stack/network_stack.dart';
import 'package:flutterdatabase/src/data/network/lib/stack/network_stack_response.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class HTTPStack implements INetworkStack {
  WebRequestBuilder mBuilder;

  HTTPStack(this.mBuilder);

  @override
  Future<NetworkStackResponse> getResult() async {
    switch (mBuilder.requestMethod) {
      case RequestMethod.GET:
        return GET();
      case RequestMethod.PUT:
      case RequestMethod.DELETE:
      case RequestMethod.POST:
        return POST_PUT_DELETE();
      case RequestMethod.MULTI_PART:
        return MULTI_PART();
      default:
        return GET();
    }
  }

  Future<NetworkStackResponse> GET() async {
    String url = mBuilder.url;

    if (mBuilder.requestParams != null) {
      url += "?" + mapToQueryString(mBuilder.requestParams);
    }

    if (mBuilder.debug) {
      print("URL:$url");
    }

    var headers = mBuilder.header != null ? mBuilder.header : Map();

    HttpClient client = new HttpClient();
    HttpClientRequest request = await client.getUrl(Uri.parse(url));

    headers.forEach((key, value) => {request.headers.add(key, value)});

    HttpClientResponse response = await request.close();

    var list = await response.transform(utf8.decoder).toList();
    var buffer = new StringBuffer();
    list.forEach((text) {
      buffer.write(text);
    });

    Map<String, String> responseHeaders = Map();
    response.headers.forEach((key, value) {
      responseHeaders[key] = value.toString();
    });

    NetworkStackResponse stackResponse = NetworkStackResponse(
      response.statusCode,
      buffer.toString(),
      headers: responseHeaders,
    );

    /*NetworkStackResponse stackResponse;
    try {
      var response = await http.get(url, headers: headers);
      if(mBuilder.debug) {
        print("Response:" + response.body);
      }

      stackResponse =
          NetworkStackResponse(response.statusCode, response.body,
            headers: response.headers,
          );
    } on SocketException catch (_) {
      print('not connected');
      stackResponse = getNetworkErrorResponse();
    }*/

    return stackResponse;
  }

  Future<NetworkStackResponse> POST_PUT_DELETE() async {
    String url = mBuilder.url;
    var headers = mBuilder.header != null ? mBuilder.header : Map();

    if (mBuilder.debug) {
      print("URL:$url");
    }

    NetworkStackResponse stackResponse;
    try {
      var response;
      if (mBuilder.requestParams != null) {
        response = await http.post(url,
            headers: headers, body: mBuilder.requestParams);
      } else if (mBuilder.requestBody != null) {
        response =
            await http.post(url, headers: headers, body: mBuilder.requestBody);
      }
      stackResponse = NetworkStackResponse(
        response.statusCode,
        response.body,
        headers: response.headers,
      );

      if (mBuilder.debug) {
        print("Response:" + response.body);
      }
    } on SocketException catch (_) {
      stackResponse = getNetworkErrorResponse();
      print('not connected');
    }

    return stackResponse;
  }

  Future<NetworkStackResponse> MULTI_PART() async {
    if (mBuilder.debug) {
      print("URL:${mBuilder.url}");
    }

    var request = new http.MultipartRequest("POST", Uri.parse(mBuilder.url));

    if (mBuilder.header != null) {
      mBuilder.header
          .forEach((key, value) => {request.headers[key] = value.toString()});
    }

    if (mBuilder.requestParams != null) {
      mBuilder.requestParams
          .forEach((k, v) => {request.fields[k] = v.toString()});
    }

    if (mBuilder.files != null) {
      for (var key in mBuilder.files.keys) {
        var file = await http.MultipartFile.fromPath(
            key, mBuilder.files[key].path,
            contentType: MediaType('image', 'jpeg'));
        request.files.add(file);
      }
    }

    NetworkStackResponse stackResponse;
    try {
      var response = await request.send();

      var result = await response.stream.bytesToString();
      stackResponse = NetworkStackResponse(
        response.statusCode,
        result,
        headers: response.headers,
      );

      if (mBuilder.debug) {
        print("Response:" + result);
      }
    } on SocketException catch (_) {
      stackResponse = getNetworkErrorResponse();
      print('not connected');
    }

    return stackResponse;
  }

  String mapToQueryString(Map<String, dynamic> params) {
    String query = "";
    for (var key in params.keys) {
      if (query != "") {
        query += "&";
      }
      query += key + "=" + params[key].toString();
    }
    return query;
  }

  NetworkStackResponse getNetworkErrorResponse() {
    return NetworkStackResponse(
      10,
      "Failed to connect with Internet",
    );
  }
}
