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
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'detail_model.dart';
export 'detail_model.dart';

class DetailWidget extends StatefulWidget {
  const DetailWidget({
    super.key,
    required this.product,
  });

  final ProductRecord? product;

  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  late DetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.product!.usersLiked.contains(currentUserReference)) {
        _model.liked = true;
        safeSetState(() {});
      }
      if (!widget!.product!.usersReviewed.contains(currentUserReference) &&
          widget!.product!.userBought.contains(currentUserReference)) {
        _model.letUserGiveReview = true;
        safeSetState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Builder(
                          builder: (context) {
                            final image = widget!
                                    .product?.productInformation?.projectImages
                                    ?.toList() ??
                                [];

                            return Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 0.45,
                              child: Stack(
                                children: [
                                  PageView.builder(
                                    controller: _model.pageViewController ??=
                                        PageController(
                                            initialPage: max(
                                                0, min(0, image.length - 1))),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: image.length,
                                    itemBuilder: (context, imageIndex) {
                                      final imageItem = image[imageIndex];
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: CachedNetworkImage(
                                          fadeInDuration:
                                              Duration(milliseconds: 500),
                                          fadeOutDuration:
                                              Duration(milliseconds: 500),
                                          imageUrl: imageItem,
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.contain,
                                        ),
                                      );
                                    },
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 16.0),
                                      child: smooth_page_indicator
                                          .SmoothPageIndicator(
                                        controller: _model
                                                .pageViewController ??=
                                            PageController(
                                                initialPage: max(0,
                                                    min(0, image.length - 1))),
                                        count: image.length,
                                        axisDirection: Axis.horizontal,
                                        onDotClicked: (i) async {
                                          await _model.pageViewController!
                                              .animateToPage(
                                            i,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                          safeSetState(() {});
                                        },
                                        effect: smooth_page_indicator
                                            .ExpandingDotsEffect(
                                          expansionFactor: 5.0,
                                          spacing: 5.0,
                                          radius: 16.0,
                                          dotWidth: 8.0,
                                          dotHeight: 4.0,
                                          dotColor: FlutterFlowTheme.of(context)
                                              .pageViewDots,
                                          activeDotColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          paintStyle: PaintingStyle.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget!
                                            .product?.productInformation?.name,
                                        'Project Name',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              if (valueOrDefault<bool>(
                                      currentUserDocument?.isSafeGuarding,
                                      false) ||
                                  valueOrDefault<bool>(
                                      currentUserDocument?.isHead, false))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '( ${valueOrDefault<String>(
                                            widget!.product?.productInformation
                                                ?.numberOfReviews
                                                ?.toString(),
                                            '0',
                                          )}  reviews )',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          Divider(
                            height: 24.0,
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).pageViewDots,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'o5wkoto8' /* Description */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget!.product?.productInformation
                                              ?.description,
                                          'Description',
                                        ),
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (widget!.product?.specialOfferRef != null)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(14.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 150.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                      ),
                                      child: Visibility(
                                        visible:
                                            widget!.product?.specialOfferRef !=
                                                null,
                                        child:
                                            StreamBuilder<SpecialOfferRecord>(
                                          stream:
                                              SpecialOfferRecord.getDocument(
                                                  widget!.product!
                                                      .specialOfferRef!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 44.0,
                                                  height: 44.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }

                                            final committeeCardSpecialOfferRecord =
                                                snapshot.data!;

                                            return wrapWithModel(
                                              model: _model.committeeCardModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: CommitteesCardWidget(
                                                title:
                                                    committeeCardSpecialOfferRecord
                                                        .title,
                                                description:
                                                    committeeCardSpecialOfferRecord
                                                        .description,
                                                image:
                                                    committeeCardSpecialOfferRecord
                                                        .image,
                                                colour: valueOrDefault<Color>(
                                                  committeeCardSpecialOfferRecord
                                                      .colour,
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  't4bmaz0f' /* Committee Leads */,
                                                ),
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 0.0),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  wrapWithModel(
                                                    model: _model
                                                        .committeeHeadModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: CommitteeHeadWidget(
                                                      defaultvalue: widget!
                                                          .product!
                                                          .productInformation
                                                          .heads
                                                          .first,
                                                      heads: widget!
                                                          .product!
                                                          .productInformation
                                                          .heads,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 16.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '28n06hrc' /* Members */,
                                                ),
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 0.0),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  wrapWithModel(
                                                    model: _model
                                                        .committeeMembersModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CommitteeMembersWidget(
                                                      defaultValue: widget!
                                                          .product!
                                                          .productInformation
                                                          .members
                                                          .first,
                                                      members: widget!
                                                          .product!
                                                          .productInformation
                                                          .members,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (valueOrDefault<bool>(
                                currentUserDocument?.isHead, false) ||
                            valueOrDefault<bool>(
                                currentUserDocument?.isSafeGuarding, false))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'xic97283' /* Last 3 comments */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  if (widget!.product!.productInformation
                                          .numberOfReviews >
                                      3)
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'comment',
                                          queryParameters: {
                                            'product': serializeParam(
                                              widget!.product,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'product': widget!.product,
                                          },
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 5.0, 0.0, 5.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'gqq3y3bn' /* See All Comment */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        if (valueOrDefault<bool>(
                                currentUserDocument?.isHead, false) ||
                            valueOrDefault<bool>(
                                currentUserDocument?.isSafeGuarding, false))
                          AuthUserStreamWidget(
                            builder: (context) =>
                                FutureBuilder<List<ReviewRecord>>(
                              future: queryReviewRecordOnce(
                                queryBuilder: (reviewRecord) =>
                                    reviewRecord.where(
                                  'product_ref',
                                  isEqualTo: widget!.product?.reference,
                                ),
                                limit: 3,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 44.0,
                                      height: 44.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<ReviewRecord> listViewReviewRecordList =
                                    snapshot.data!;
                                if (listViewReviewRecordList.isEmpty) {
                                  return EmptyWidget(
                                    body: 'This project has no review.',
                                    customAction: () async {},
                                  );
                                }

                                return ListView.separated(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    24.0,
                                    0,
                                    24.0,
                                  ),
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewReviewRecordList.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 16.0),
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewReviewRecord =
                                        listViewReviewRecordList[listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: ReviewWidget(
                                        key: Key(
                                            'Key6jo_${listViewIndex}_of_${listViewReviewRecordList.length}'),
                                        date: listViewReviewRecord
                                            .reviewInformation.date!,
                                        userAvatar: listViewReviewRecord
                                            .reviewInformation.user.avatar,
                                        userName: listViewReviewRecord
                                            .reviewInformation.user.name,
                                        reviewNumber: listViewReviewRecord
                                            .reviewInformation.number,
                                        reviewFeedback: listViewReviewRecord
                                            .reviewInformation.feedback,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (valueOrDefault<bool>(
                                currentUserDocument?.isStudent, false))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => FFButtonWidget(
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => FocusScope.of(context)
                                                .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: CommentGiveWidget(
                                                product: widget!.product!,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'rp699b33' /* Give Comment */,
                                    ),
                                    icon: Icon(
                                      FFIcons.kstarDefault,
                                      size: 16.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: 160.0,
                                      height: 48.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      iconPadding: EdgeInsets.all(0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ].addToEnd(SizedBox(height: 90.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 99.0,
                        buttonSize: 48.0,
                        fillColor: Color(0x7DE0E0E0),
                        icon: Icon(
                          Icons.chevron_left,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.safePop();
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                      child: Container(
                        width: 48.0,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: Color(0x7DE0E0E0),
                          shape: BoxShape.circle,
                        ),
                        child: ToggleIcon(
                          onPressed: () async {
                            safeSetState(() => _model.liked = !_model.liked);
                            if (!_model.liked) {
                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'products_liked': FieldValue.arrayRemove(
                                        [widget!.product?.reference]),
                                  },
                                ),
                              });

                              await widget!.product!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'users_liked': FieldValue.arrayRemove(
                                        [currentUserReference]),
                                  },
                                ),
                              });
                            } else {
                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'products_liked': FieldValue.arrayUnion(
                                        [widget!.product?.reference]),
                                  },
                                ),
                              });

                              await widget!.product!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'users_liked': FieldValue.arrayUnion(
                                        [currentUserReference]),
                                  },
                                ),
                              });
                            }
                          },
                          value: _model.liked,
                          onIcon: Icon(
                            Icons.favorite,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 25.0,
                          ),
                          offIcon: Icon(
                            Icons.favorite_border,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 25.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Container(
                  width: double.infinity,
                  height: 90.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Divider(
                        height: 1.0,
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).pageViewDots,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await currentUserDocument!.cartRef!.update({
                                    ...mapToFirestore(
                                      {
                                        'products': FieldValue.arrayUnion([
                                          getBookmarkProjectFirestoreData(
                                            createBookmarkProjectStruct(
                                              projectRef:
                                                  widget!.product?.reference,
                                              name: widget!.product
                                                  ?.productInformation?.name,
                                              image: widget!
                                                  .product
                                                  ?.productInformation
                                                  ?.projectCover,
                                              clearUnsetFields: false,
                                            ),
                                            true,
                                          )
                                        ]),
                                      },
                                    ),
                                  });
                                  context.safePop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Added!',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 2000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                },
                                text: FFLocalizations.of(context).getText(
                                  'ks32533k' /* Bookmark Project */,
                                ),
                                icon: Icon(
                                  Icons.bookmark_add,
                                  size: 16.0,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 48.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
