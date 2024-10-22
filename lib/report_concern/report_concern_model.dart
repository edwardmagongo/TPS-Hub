import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat_components/empty_list_2/empty_list2_widget.dart';
import '/components/nav_bar_s_a/nav_bar_s_a_widget.dart';
import '/components/sidenav/sidenav_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'report_concern_widget.dart' show ReportConcernWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReportConcernModel extends FlutterFlowModel<ReportConcernWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sidenav component.
  late SidenavModel sidenavModel;
  // Model for NavBarSA component.
  late NavBarSAModel navBarSAModel;

  @override
  void initState(BuildContext context) {
    sidenavModel = createModel(context, () => SidenavModel());
    navBarSAModel = createModel(context, () => NavBarSAModel());
  }

  @override
  void dispose() {
    sidenavModel.dispose();
    navBarSAModel.dispose();
  }
}
