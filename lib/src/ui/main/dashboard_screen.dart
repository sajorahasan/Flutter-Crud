import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdatabase/src/data/local/entity/user.dart';
import 'package:flutterdatabase/src/data/local/repository_factory.dart';
import 'package:flutterdatabase/src/data/network/controller/user_controller.dart';
import 'package:flutterdatabase/src/ui/main/add_employee_screen.dart';
import 'package:flutterdatabase/src/ui/main/user_card.dart';
import 'package:flutterdatabase/src/ui/widget/Button.dart';
import 'package:flutterdatabase/src/ui/widget/EmptyView.dart';
import 'package:flutterdatabase/src/ui/widget/Header.dart';
import 'package:flutterdatabase/src/utils/app_utils.dart';
import 'package:flutterdatabase/src/utils/dialog_utils.dart';
import 'package:flutterdatabase/src/utils/intent_utils.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class DashboardScreen extends StatefulWidget {
  static void goToNextScreen(BuildContext context, {user}) {
    print('goToNextScreen $user');
    IntentUtil.switchPage(context, AddEmployeeScreen(user));
  }

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<DashboardScreen> {
  List<User> users = [];

  _DashboardState() {}

  @override
  void initState() {
    super.initState();
    //Future.delayed(Duration.zero, this.fetchUsersListing);
  }

  void fetchUsersListing() {
    UserController(context)
        .getAllUsers()
        .then((list) => {print("fetchUsersListing ==> $list")});
  }

  Future<List<User>> getAllUsers() async {
    return await localRepository.userRepo.getAll();
  }

  Widget getFABButton() {
    return Button.getFloatingButton(onPressed: () {
      DashboardScreen.goToNextScreen(context);
    });
  }

  void _deleteAllUsers() async {
    await localRepository.userRepo.clear();
    setState(() => {});
    AppUtils.showToast("All Users deleted successfully!!!", toastType: 1);
  }

  List<Widget> getMenuAction() {
    return <Widget>[
      new IconButton(
        icon: new Icon(OMIcons.deleteOutline),
        color: Colors.red,
        tooltip: "Delete All",
        onPressed: () {
          DialogUtils.showDeleteConfirmationDialog(
              context, "Are you sure you want to delete all Users?", () {
            _deleteAllUsers();
          });
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: getFABButton(),
      appBar: Header.getAppBar(context, 'Dashboard', actions: getMenuAction()),
      body: Container(
          padding: EdgeInsets.all(10),
          child: FutureBuilder<List<User>>(
            future: getAllUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data.length > 0) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  padding: EdgeInsets.all(8.0),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[UserCard(snapshot.data[index])],
                    );
                  },
                );
              } else {
                return Center(
                  child: EmptyView(
                    icon: OMIcons.person,
                    title: 'No User found.',
                    subTitle: 'Please add the new user.',
                  ),
                );
              }
            },
          )),
    );
  }
}
