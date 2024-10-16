import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/create_modal_widget.dart';
import '/components/empty_list1_widget.dart';
import '/components/empty_list_stories_widget.dart';
import '/components/nav_bar_s_a/nav_bar_s_a_widget.dart';
import '/components/sidenav/sidenav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_components/post_modal_view/post_modal_view_widget.dart';
import '/web_components/story_modal_view/story_modal_view_widget.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'main_feed_widget.dart' show MainFeedWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainFeedModel extends FlutterFlowModel<MainFeedWidget> {
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
