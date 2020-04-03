import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterdatabase/src/data/network/lib/handler/web_request_executor.dart';

/// Supported Request method.
enum RequestMethod { GET, POST, PUT, DELETE, MULTI_PART }

class WebRequestBuilder {
  /// Application Context.
  /// <p>
  /// If showProgressDialog or showErrorDialog is true then context must be instance of {@link android.app.Activity}
  BuildContext context;

  /// Request URL
  String url;

  /// Request method.
  /// currently supporting GET and POST only.
  RequestMethod requestMethod;

  /// Request Header
  Map<String, String> header;

  /// Request param for GET or POST request
  Map<String, dynamic> requestParams;

  /// Request param for MULTI_PART request
  Map<String, File> files;

  /// String body for POST request
  String requestBody;

  /// Show Progress Dialog
  bool showProgress;

  /// Show Progress Dialog
  bool handleError;

  /// Show Progress Dialog
  bool debug;

  WebRequestBuilder(this.url,
      {this.context,
      this.requestMethod = RequestMethod.GET,
      this.header,
      this.requestParams,
      this.requestBody,
      this.files,
      this.showProgress = true,
      this.handleError = false,
      this.debug = true});

  WebRequestExecutor build() {
    return WebRequestExecutor(this);
  }

  @override
  String toString() {
    return 'WebRequestBuilder{context: $context, url: $url, requestMethod: $requestMethod, header: $header, requestParams: $requestParams, files: $files, requestBody: $requestBody, showProgress: $showProgress, handleError: $handleError, debug: $debug}';
  }
}
