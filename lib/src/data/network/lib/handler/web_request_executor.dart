import 'package:flutter/widgets.dart';
import 'package:flutterdatabase/src/data/network/lib/exception/response_error.dart';
import 'package:flutterdatabase/src/data/network/lib/handler/web_request_builder.dart';
import 'package:flutterdatabase/src/data/network/lib/stack/dio_stack.dart';
import 'package:flutterdatabase/src/data/network/lib/stack/network_stack.dart';
import 'package:flutterdatabase/src/utils/dialog_utils.dart';

class WebRequestExecutor {
  WebRequestBuilder mRequestBuilder;
  INetworkStack mNetworkStack;

  WebRequestExecutor(this.mRequestBuilder) {
    mNetworkStack = DioStack(mRequestBuilder);
  }

  Future<String> get() async {
    if (mRequestBuilder.debug) {
      print(mRequestBuilder.toString());
    }

    if (mRequestBuilder.showProgress && mRequestBuilder.context != null) {
      DialogUtils.showProgressDialog(mRequestBuilder.context);
    }

    var response = await mNetworkStack.getResult();
    if (mRequestBuilder.debug) {
      print("Response:" + response.toString());
    }

    if (mRequestBuilder.showProgress && mRequestBuilder.context != null) {
      //Navigator.of(mRequestBuilder.context).pop();
      Navigator.of(mRequestBuilder.context, rootNavigator: true).pop('dialog');
    }

    String error = "";
    if (response.status == 200) {
      return response.result;
//      BaseEntity entity = BaseEntity.parse(response.result);
//      if (entity != null && entity.status == 1) {
//        //Success
//        return response.result;
//      } else {
//        //Error
//        error = entity.message;
//      }
    } else if (response.status == 401) {
      if (mRequestBuilder.handleError && mRequestBuilder.context != null) {
        //ProfilePref.logout(mRequestBuilder.context);
      }
      //Error
      error = "You'r logged out from the app";
    } else {
      if (response.status < 100) {
        //Error
        error = response.result;
      } else if (response.result.isNotEmpty) {
        error = response.result;
      } else {
        error = "Something went wrong!";
      }
    }

    if (mRequestBuilder.handleError && mRequestBuilder.context != null) {
      DialogUtils.showErrorDialog(mRequestBuilder.context, error);
    }

    throw ResponseError(response: response);
  }
}
