import '/backend/schema/structs/index.dart';
import '/components/project_item/project_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'remove_from_card_confirm_widget.dart' show RemoveFromCardConfirmWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RemoveFromCardConfirmModel
    extends FlutterFlowModel<RemoveFromCardConfirmWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ProjectItem component.
  late ProjectItemModel projectItemModel;

  @override
  void initState(BuildContext context) {
    projectItemModel = createModel(context, () => ProjectItemModel());
  }

  @override
  void dispose() {
    projectItemModel.dispose();
  }
}
