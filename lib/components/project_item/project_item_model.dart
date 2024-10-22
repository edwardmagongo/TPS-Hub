import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modals/remove_from_card_confirm/remove_from_card_confirm_widget.dart';
import 'project_item_widget.dart' show ProjectItemWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProjectItemModel extends FlutterFlowModel<ProjectItemWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Bottom Sheet - RemoveFromCardConfirm] action in IconButton widget.
  bool? removeConfirm;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
