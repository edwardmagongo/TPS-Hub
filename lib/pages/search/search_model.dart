import '/backend/backend.dart';
import '/components/empty/empty_widget.dart';
import '/components/header/header_widget.dart';
import '/components/project_search_item/project_search_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'search_widget.dart' show SearchWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  Local state fields for this page.

  List<ProductRecord> searchResult = [];
  void addToSearchResult(ProductRecord item) => searchResult.add(item);
  void removeFromSearchResult(ProductRecord item) => searchResult.remove(item);
  void removeAtIndexFromSearchResult(int index) => searchResult.removeAt(index);
  void insertAtIndexInSearchResult(int index, ProductRecord item) =>
      searchResult.insert(index, item);
  void updateSearchResultAtIndex(int index, Function(ProductRecord) updateFn) =>
      searchResult[index] = updateFn(searchResult[index]);

  String category = 'All';

  double priceBiggerThan = 0.0;

  double rateBiggerThan = 0.0;

  bool showFilter = false;

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for tf_search widget.
  FocusNode? tfSearchFocusNode;
  TextEditingController? tfSearchTextController;
  String? Function(BuildContext, String?)? tfSearchTextControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for priceBigger widget.
  double? priceBiggerValue1;
  // State field(s) for priceBigger widget.
  double? priceBiggerValue2;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    tfSearchFocusNode?.dispose();
    tfSearchTextController?.dispose();
  }
}
