import '/backend/backend.dart';
import '/components/empty/empty_widget.dart';
import '/components/header/header_widget.dart';
import '/components/project_search_item/project_search_item_widget.dart';
import '/components/review/review_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'comment_widget.dart' show CommentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class CommentModel extends FlutterFlowModel<CommentWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for ProjectSearchItem component.
  late ProjectSearchItemModel projectSearchItemModel;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ReviewRecord>? listViewPagingController;
  Query? listViewPagingQuery;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    projectSearchItemModel =
        createModel(context, () => ProjectSearchItemModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    projectSearchItemModel.dispose();

    listViewPagingController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, ReviewRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, ReviewRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ReviewRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryReviewRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          controller: controller,
          pageSize: 25,
          isStream: false,
        ),
      );
  }
}
