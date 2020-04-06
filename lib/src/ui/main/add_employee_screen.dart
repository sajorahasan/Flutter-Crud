import 'package:cloud_firestore/cloud_firestore.dart';
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

  final Firestore _firestore = Firestore();

  AddEmployeeScreen(this._user);

  @override
  _AddEmployeeState createState() => _AddEmployeeState(_user, _firestore);
}

class _AddEmployeeState extends State<AddEmployeeScreen> {
  final User _user;

  final Firestore _firestore;

  CollectionReference get users => _firestore.collection('users');

  TextEditingController mNameController;
  TextEditingController mEmailController;
  TextEditingController mAgeController;

  FocusNode mEmailFocusNode = new FocusNode();
  FocusNode mAgeFocusNode = new FocusNode();

  int _genderValue = 0;

  _AddEmployeeState(this._user, this._firestore) {
    if (_user != null) {
      mNameController = TextEditingController(text: _user.name);
      mEmailController = TextEditingController(text: _user.email);
      mAgeController = TextEditingController(text: _user.age.toString());
      _genderValue = _user.gender == "Male" ? 0 : 1;
    } else {
      mNameController = TextEditingController();
      mEmailController = TextEditingController();
      mAgeController = TextEditingController();
    }
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

  Future<void> addEmployee() async {
    var user = new User();
    user.documentId = "xdayy78";
    user.name = mNameController.text.trim();
    user.email = mEmailController.text.trim();
    user.gender = _genderValue == 0 ? "Male" : "Female";
    user.age = int.parse(mAgeController.text.trim());
    DialogUtils.showProgressDialog(context);
    await users.document().setData(user.toJson());

    var res = await localRepository.userRepo.insert(user);
    Navigator.of(context, rootNavigator: true).pop('dialog');
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
    user.gender = _genderValue == 0 ? "Male" : "Female";
    user.age = int.parse(mAgeController.text.trim());
    DialogUtils.showProgressDialog(context);
    String docId = "";
    await users.getDocuments().then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        if (f.data["documentId"] == user.documentId) docId = f.documentID;
      });
    });

    await users.document(docId).setData(user.toJson());

    var res = await localRepository.userRepo.update(user);
    Navigator.of(context, rootNavigator: true).pop('dialog');
    if (res != null) {
      FocusScope.of(context).requestFocus(FocusNode());
      setState(() => _autoValidate = false);
      AppUtils.showToast('User updated successfully!!!', toastType: 1);
      IntentUtil.goBack(context);
    }
  }

  void deleteUser() async {
    DialogUtils.showProgressDialog(context);
    String docId = "";
    await users.getDocuments().then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        if (f.data["documentId"] == _user.documentId) docId = f.documentID;
      });
    });
    await users.document(docId).delete();
    var res = await localRepository.userRepo.deleteById(_user.id);
    Navigator.of(context, rootNavigator: true).pop('dialog');
    if (res != null) {
      FocusScope.of(context).requestFocus(FocusNode());
      setState(() => _autoValidate = false);
      AppUtils.showToast('User deleted successfully!!!', toastType: 1);
      IntentUtil.goBack(context);
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
                SizedBox(height: 24),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Select a gender:",
                    softWrap: true,
                  ),
                ),
                getGenderRadioButton(
                  title: "Male",
                  value: 0,
                  onChanged: (val) => setState(() => _genderValue = val),
                ),
                getGenderRadioButton(
                  title: "Female",
                  value: 1,
                  onChanged: (val) => setState(() => _genderValue = val),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getGenderRadioButton({String title, int value, Function onChanged}) {
    return RadioListTile(
      value: value,
      groupValue: _genderValue,
      onChanged: onChanged,
      title: Text(title),
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

  @override
  Widget build(BuildContext context) {
    print('selectedGender ==> $_genderValue');
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
