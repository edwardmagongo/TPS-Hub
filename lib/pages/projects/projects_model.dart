import '/backend/backend.dart';
import '/components/committees_card/committees_card_widget.dart';
import '/components/empty/empty_widget.dart';
import '/components/header/header_widget.dart';
import '/components/project_items/project_items_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'projects_widget.dart' show ProjectsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProjectsModel extends FlutterFlowModel<ProjectsWidget> {
  ///  Local state fields for this page.

  String categori = 'All';

  String folder = 'Initiatives';

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for CommitteesCard component.
  late CommitteesCardModel committeesCardModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  String? get choiceChipsValue1 =>
      choiceChipsValueController1?.value?.firstOrNull;
  set choiceChipsValue1(String? val) =>
      choiceChipsValueController1?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  String? get choiceChipsValue2 =>
      choiceChipsValueController2?.value?.firstOrNull;
  set choiceChipsValue2(String? val) =>
      choiceChipsValueController2?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    committeesCardModel = createModel(context, () => CommitteesCardModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    committeesCardModel.dispose();
  }
}
