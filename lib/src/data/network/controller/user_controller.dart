import 'package:flutter/cupertino.dart';
import 'package:flutterdatabase/src/data/local/entity/user.dart';
import 'package:flutterdatabase/src/data/network/controller/base_controller.dart';
import 'package:flutterdatabase/src/data/network/lib/exception/response_error.dart';
import 'package:flutterdatabase/src/data/network/lib/handler/web_request_builder.dart';
import 'package:flutterdatabase/src/data/network/webservice_url.dart';

class UserController extends BaseController {
  UserController(BuildContext context) : super(context);

  Future getAllUsers() async {
    WebRequestBuilder builder = WebRequestBuilder(
      UserURL.getUser,
      context: mContext,
      header: getHeader(),
    );

    try {
      String json = await builder.build().get();
      print("response is ===> $json");
      //var entity = EOMEntity.parse(json);

      //return entity.eomList;
    } on ResponseError catch (e) {
      showLog("Erroor");
    }

    return [];
  }
}
