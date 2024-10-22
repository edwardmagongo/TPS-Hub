import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/committee_head/committee_head_widget.dart';
import '/components/committee_members/committee_members_widget.dart';
import '/components/committees_card/committees_card_widget.dart';
import '/components/empty/empty_widget.dart';
import '/components/review/review_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/comment_give/comment_give_widget.dart';
import 'detail_widget.dart' show DetailWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailModel extends FlutterFlowModel<DetailWidget> {
  ///  Local state fields for this page.

  bool liked = false;

  bool letUserGiveReview = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for CommitteeCard.
  late CommitteesCardModel committeeCardModel;
  // Model for CommitteeHead component.
  late CommitteeHeadModel committeeHeadModel;
  // Model for CommitteeMembers component.
  late CommitteeMembersModel committeeMembersModel;

  @override
  void initState(BuildContext context) {
    committeeCardModel = createModel(context, () => CommitteesCardModel());
    committeeHeadModel = createModel(context, () => CommitteeHeadModel());
    committeeMembersModel = createModel(context, () => CommitteeMembersModel());
  }

  @override
  void dispose() {
    committeeCardModel.dispose();
    committeeHeadModel.dispose();
    committeeMembersModel.dispose();
  }
}
