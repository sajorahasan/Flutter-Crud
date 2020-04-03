import 'package:flutter/material.dart';
import 'package:flutterdatabase/src/data/network/lib/handler/web_request_builder.dart';

class BaseController {
  BuildContext mContext;
  static const SHOW_LOG = false;

  BaseController(this.mContext);

  Map<String, String> getHeader() {
    Map<String, String> headers = Map();

    headers["Content-Type"] = "application/json";

    return headers;
  }

  WebRequestBuilder getRequestBuilder(String url) {
    return WebRequestBuilder(
      url,
      context: mContext,
      header: getHeader(),
    );
  }

  WebRequestBuilder postRequestBuilder(String url) {
    return WebRequestBuilder(
      url,
      requestMethod: RequestMethod.POST,
      context: mContext,
      header: getHeader(),
    );
  }

  showLog(String log) {
    if (SHOW_LOG) {
      print(log);
    }
  }
}
