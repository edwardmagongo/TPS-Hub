import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode1;
  TextEditingController? emailTextFieldTextController1;
  String? Function(BuildContext, String?)?
      emailTextFieldTextController1Validator;
  String? _emailTextFieldTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vpd2uinh' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for PasswordTextField widget.
  FocusNode? passwordTextFieldFocusNode1;
  TextEditingController? passwordTextFieldTextController1;
  late bool passwordTextFieldVisibility1;
  String? Function(BuildContext, String?)?
      passwordTextFieldTextController1Validator;
  String? _passwordTextFieldTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'sapcnpa8' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for RememberMeCheckbox widget.
  bool? rememberMeCheckboxValue1;
  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode2;
  TextEditingController? emailTextFieldTextController2;
  String? Function(BuildContext, String?)?
      emailTextFieldTextController2Validator;
  String? _emailTextFieldTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4ekxafjp' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for PasswordTextField widget.
  FocusNode? passwordTextFieldFocusNode2;
  TextEditingController? passwordTextFieldTextController2;
  late bool passwordTextFieldVisibility2;
  String? Function(BuildContext, String?)?
      passwordTextFieldTextController2Validator;
  String? _passwordTextFieldTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wuz1kp5a' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for RememberMeCheckbox widget.
  bool? rememberMeCheckboxValue2;
  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode3;
  TextEditingController? emailTextFieldTextController3;
  String? Function(BuildContext, String?)?
      emailTextFieldTextController3Validator;
  String? _emailTextFieldTextController3Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jc24qt69' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for PasswordTextField widget.
  FocusNode? passwordTextFieldFocusNode3;
  TextEditingController? passwordTextFieldTextController3;
  late bool passwordTextFieldVisibility3;
  String? Function(BuildContext, String?)?
      passwordTextFieldTextController3Validator;
  String? _passwordTextFieldTextController3Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2a23tco4' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for RememberMeCheckbox widget.
  bool? rememberMeCheckboxValue3;
  // Model for Header component.
  late HeaderModel headerModel;

  @override
  void initState(BuildContext context) {
    emailTextFieldTextController1Validator =
        _emailTextFieldTextController1Validator;
    passwordTextFieldVisibility1 = false;
    passwordTextFieldTextController1Validator =
        _passwordTextFieldTextController1Validator;
    emailTextFieldTextController2Validator =
        _emailTextFieldTextController2Validator;
    passwordTextFieldVisibility2 = false;
    passwordTextFieldTextController2Validator =
        _passwordTextFieldTextController2Validator;
    emailTextFieldTextController3Validator =
        _emailTextFieldTextController3Validator;
    passwordTextFieldVisibility3 = false;
    passwordTextFieldTextController3Validator =
        _passwordTextFieldTextController3Validator;
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    emailTextFieldFocusNode1?.dispose();
    emailTextFieldTextController1?.dispose();

    passwordTextFieldFocusNode1?.dispose();
    passwordTextFieldTextController1?.dispose();

    emailTextFieldFocusNode2?.dispose();
    emailTextFieldTextController2?.dispose();

    passwordTextFieldFocusNode2?.dispose();
    passwordTextFieldTextController2?.dispose();

    emailTextFieldFocusNode3?.dispose();
    emailTextFieldTextController3?.dispose();

    passwordTextFieldFocusNode3?.dispose();
    passwordTextFieldTextController3?.dispose();

    headerModel.dispose();
  }
}
