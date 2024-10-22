import '/auth/firebase_auth/auth_util.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'forgot_pass_widget.dart' show ForgotPassWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotPassModel extends FlutterFlowModel<ForgotPassWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode1;
  TextEditingController? emailTextFieldTextController1;
  String? Function(BuildContext, String?)?
      emailTextFieldTextController1Validator;
  String? _emailTextFieldTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0lpnh5xu' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode2;
  TextEditingController? emailTextFieldTextController2;
  String? Function(BuildContext, String?)?
      emailTextFieldTextController2Validator;
  String? _emailTextFieldTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1eyd09a2' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode3;
  TextEditingController? emailTextFieldTextController3;
  String? Function(BuildContext, String?)?
      emailTextFieldTextController3Validator;
  String? _emailTextFieldTextController3Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'rp50w534' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    emailTextFieldTextController1Validator =
        _emailTextFieldTextController1Validator;
    emailTextFieldTextController2Validator =
        _emailTextFieldTextController2Validator;
    emailTextFieldTextController3Validator =
        _emailTextFieldTextController3Validator;
  }

  @override
  void dispose() {
    headerModel.dispose();
    emailTextFieldFocusNode1?.dispose();
    emailTextFieldTextController1?.dispose();

    emailTextFieldFocusNode2?.dispose();
    emailTextFieldTextController2?.dispose();

    emailTextFieldFocusNode3?.dispose();
    emailTextFieldTextController3?.dispose();
  }
}
