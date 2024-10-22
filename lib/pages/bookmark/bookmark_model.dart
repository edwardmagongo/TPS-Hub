import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty/empty_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/project_item/project_item_widget.dart';
import '/components/sidenav/sidenav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'bookmark_widget.dart' show BookmarkWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookmarkModel extends FlutterFlowModel<BookmarkWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sidenav component.
  late SidenavModel sidenavModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    sidenavModel = createModel(context, () => SidenavModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    sidenavModel.dispose();
    navBarModel.dispose();
  }
}
