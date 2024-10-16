import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_components/post_details_base/post_details_base_widget.dart';
import 'post_details_page_widget.dart' show PostDetailsPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PostDetailsPageModel extends FlutterFlowModel<PostDetailsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for postDetails_Base component.
  late PostDetailsBaseModel postDetailsBaseModel;

  @override
  void initState(BuildContext context) {
    postDetailsBaseModel = createModel(context, () => PostDetailsBaseModel());
  }

  @override
  void dispose() {
    postDetailsBaseModel.dispose();
  }
}
