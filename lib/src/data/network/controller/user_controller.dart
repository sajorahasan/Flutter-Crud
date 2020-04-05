import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutterdatabase/src/data/local/entity/user.dart';
import 'package:flutterdatabase/src/data/network/controller/base_controller.dart';
import 'package:flutterdatabase/src/data/network/entity/users_callback.dart';
import 'package:flutterdatabase/src/data/network/lib/exception/response_error.dart';
import 'package:flutterdatabase/src/data/network/lib/handler/web_request_builder.dart';
import 'package:flutterdatabase/src/data/network/webservice_url.dart';

class UserController extends BaseController {
  UserController(BuildContext context) : super(context);

  Future<List<User>> getAllUsers() async {
    WebRequestBuilder builder = WebRequestBuilder(
      UserURL.getUser,
      context: mContext,
      header: getHeader(),
    );

    try {
      String json = await builder.build().get();

      Map userMap = jsonDecode(json);
      var res = UsersCallback.fromJson(userMap);

      List<User> users = [];

      for (var u in res.data) {
        users.add(new User(
            id: u.id,
            name: u.first_name + " " + u.last_name,
            email: u.email,
            age: 0));
      }
      return users;
    } on ResponseError catch (e) {
      showLog("Erroor");
    }

    return [];
  }
}
