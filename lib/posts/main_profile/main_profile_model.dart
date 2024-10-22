import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat/empty_state_simple/empty_state_simple_widget.dart';
import '/components/nav_bar_s_a/nav_bar_s_a_widget.dart';
import '/components/sidenav/sidenav_widget.dart';
import '/components/user_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_components/delete_post/delete_post_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'main_profile_widget.dart' show MainProfileWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainProfileModel extends FlutterFlowModel<MainProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sidenav component.
  late SidenavModel sidenavModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for userList dynamic component.
  late FlutterFlowDynamicModels<UserListModel> userListModels;
  // Model for NavBarSA component.
  late NavBarSAModel navBarSAModel;

  @override
  void initState(BuildContext context) {
    sidenavModel = createModel(context, () => SidenavModel());
    userListModels = FlutterFlowDynamicModels(() => UserListModel());
    navBarSAModel = createModel(context, () => NavBarSAModel());
  }

  @override
  void dispose() {
    sidenavModel.dispose();
    tabBarController?.dispose();
    userListModels.dispose();
    navBarSAModel.dispose();
  }
}
