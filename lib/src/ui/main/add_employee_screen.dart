import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdatabase/res/app_styles.dart';
import 'package:flutterdatabase/src/data/local/entity/user.dart';
import 'package:flutterdatabase/src/data/local/repository_factory.dart';
import 'package:flutterdatabase/src/ui/widget/Button.dart';
import 'package:flutterdatabase/src/ui/widget/Header.dart';
import 'package:flutterdatabase/src/ui/widget/TextInput.dart';
import 'package:flutterdatabase/src/utils/app_utils.dart';
import 'package:flutterdatabase/src/utils/dialog_utils.dart';
import 'package:flutterdatabase/src/utils/intent_utils.dart';
import 'package:flutterdatabase/src/utils/validation_utils.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class AddEmployeeScreen extends StatefulWidget {
  final User _user;

  AddEmployeeScreen(this._user);

  @override
  _AddEmployeeState createState() => _AddEmployeeState(_user);
}

class _AddEmployeeState extends State<AddEmployeeScreen> {
  final User _user;

  TextEditingController mNameController;
  TextEditingController mEmailController;
  TextEditingController mAgeController;

  FocusNode mEmailFocusNode = new FocusNode();
  FocusNode mAgeFocusNode = new FocusNode();

  _AddEmployeeState(this._user) {
    if (_user != null) {
      mNameController = TextEditingController(text: _user.name);
      mEmailController = TextEditingController(text: _user.email);
      mAgeController = TextEditingController(text: _user.age.toString());
    } else {
      mNameController = TextEditingController();
      mEmailController = TextEditingController();
      mAgeController = TextEditingController();
    }
  }

  var _formKeyLogin = GlobalKey<FormState>();
  bool _autoValidate = false;

  Widget getTextInput() {
    final title = Text("Please fill the below details:",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.grey[800],
            fontFamily: AppStyles.FONT_MEDIUM,
            fontSize: 18));

    final name = TextInput.getTextFormField("Name",
        basicValidation: ValidationUtils.textInputValidator(
            mNameController.text.toString(), "Name"),
        controller: mNameController, onFieldSubmitted: (value) {
      FocusScope.of(context).requestFocus(mEmailFocusNode);
    },
        inputType: TextInputType.text,
        textCapitalization: TextCapitalization.words,
        icon: Icon(OMIcons.person));

    final email = TextInput.getTextFormField("Email",
        customValidator: ValidationUtils.emailValidator,
        focusNode: mEmailFocusNode,
        controller: mEmailController, onFieldSubmitted: (value) {
      FocusScope.of(context).requestFocus(mAgeFocusNode);
    },
        inputType: TextInputType.emailAddress,
        textCapitalization: TextCapitalization.none,
        icon: Icon(OMIcons.email));

    final age = TextInput.getTextFormField("Age",
        basicValidation: ValidationUtils.textInputValidator(
            mAgeController.text.toString(), "Age"),
        focusNode: mAgeFocusNode,
        controller: mAgeController, onFieldSubmitted: (value) {
      FocusScope.of(context).requestFocus(FocusNode());
    },
        textInputAction: TextInputAction.done,
        inputType: TextInputType.number,
        textCapitalization: TextCapitalization.none,
        icon: Icon(OMIcons.accountBalance));

    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        children: <Widget>[
          title,
          SizedBox(height: 12),
          Form(
            key: _formKeyLogin,
            autovalidate: _autoValidate,
            child: Column(
              children: <Widget>[
                name,
                SizedBox(height: 12),
                email,
                SizedBox(height: 12),
                age,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getButton(String action, Function func) {
    return SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: Button.getRaisedButton(action, func));
  }

  Widget getButtons() {
    final deleteBtn = _user != null
        ? getButton("Delete User", () {
            DialogUtils.showDeleteConfirmationDialog(context,
                "Are you sure you want to delete?", () => deleteUser());
          })
        : SizedBox();
    return (Column(
      children: <Widget>[
        SizedBox(height: 14),
        getButton(_user != null ? "Update User" : "Add User",
            () => validateFormInputs()),
        SizedBox(height: 14),
        deleteBtn
      ],
    ));
  }

  void validateFormInputs() {
    if (_formKeyLogin.currentState.validate()) {
      _formKeyLogin.currentState.save();
      if (_user != null)
        updateEmployee();
      else
        addEmployee();
    } else {
      setState(() => _autoValidate = true);
    }
  }

  void addEmployee() async {
    var user = new User();
    user.name = mNameController.text.trim();
    user.email = mEmailController.text.trim();
    user.gender = "Male";
    user.age = int.parse(mAgeController.text.trim());

    var res = await localRepository.userRepo.insert(user);
    if (res != null) {
      FocusScope.of(context).requestFocus(FocusNode());
      mNameController = TextEditingController(text: '');
      mEmailController = TextEditingController(text: '');
      mAgeController = TextEditingController(text: '');
      setState(() => _autoValidate = false);
      AppUtils.showToast('User added successfully!!!');
    }
  }

  void updateEmployee() async {
    var user = _user;
    user.name = mNameController.text.trim();
    user.email = mEmailController.text.trim();
    user.gender = "Male";
    user.age = int.parse(mAgeController.text.trim());

    var res = await localRepository.userRepo.update(user);
    if (res != null) {
      FocusScope.of(context).requestFocus(FocusNode());
      setState(() => _autoValidate = false);
      AppUtils.showToast('User updated successfully!!!', toastType: 1);
      IntentUtil.goBack(context);
    }
  }

  void deleteUser() async {
    var res = await localRepository.userRepo.deleteById(_user.id);
    if (res != null) {
      FocusScope.of(context).requestFocus(FocusNode());
      setState(() => _autoValidate = false);
      AppUtils.showToast('User deleted successfully!!!', toastType: 1);
      IntentUtil.goBack(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header.getAppBar(
          context, _user != null ? "Update User" : "Add User",
          showBack: true),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Wrap(
                children: <Widget>[
                  new Card(
                    color: Colors.white,
                    elevation: 2,
                    child: getTextInput(),
                  ),
                ],
              ),
              IntrinsicWidth(
                child: getButtons(),
              )
            ],
          )),
    );
  }
}
