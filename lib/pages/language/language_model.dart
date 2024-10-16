import '/components/header/header_widget.dart';
import '/components/languages_item/languages_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'language_widget.dart' show LanguageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LanguageModel extends FlutterFlowModel<LanguageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for en.
  late LanguagesItemModel enModel;
  // Model for es.
  late LanguagesItemModel esModel;
  // Model for fr.
  late LanguagesItemModel frModel;
  // Model for ar.
  late LanguagesItemModel arModel;
  // Model for ke.
  late LanguagesItemModel keModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    enModel = createModel(context, () => LanguagesItemModel());
    esModel = createModel(context, () => LanguagesItemModel());
    frModel = createModel(context, () => LanguagesItemModel());
    arModel = createModel(context, () => LanguagesItemModel());
    keModel = createModel(context, () => LanguagesItemModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    enModel.dispose();
    esModel.dispose();
    frModel.dispose();
    arModel.dispose();
    keModel.dispose();
  }
}
