import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/avatar_with_update/avatar_with_update_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/sidenav/sidenav_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/logout_confirm_modal/logout_confirm_modal_widget.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sidenav component.
  late SidenavModel sidenavModel;
  // Model for avatarWithUpdate component.
  late AvatarWithUpdateModel avatarWithUpdateModel;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    sidenavModel = createModel(context, () => SidenavModel());
    avatarWithUpdateModel = createModel(context, () => AvatarWithUpdateModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    sidenavModel.dispose();
    avatarWithUpdateModel.dispose();
    navBarModel.dispose();
  }
}
