import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat/empty_state_simple/empty_state_simple_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'chat2_invite_users_model.dart';
export 'chat2_invite_users_model.dart';

class Chat2InviteUsersWidget extends StatefulWidget {
  const Chat2InviteUsersWidget({
    super.key,
    this.chatRef,
  });

  final ChatsRecord? chatRef;

  @override
  State<Chat2InviteUsersWidget> createState() => _Chat2InviteUsersWidgetState();
}

class _Chat2InviteUsersWidgetState extends State<Chat2InviteUsersWidget> {
  late Chat2InviteUsersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Chat2InviteUsersModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.chatRef != null) {
        // addChatUsers_ToList
        _model.friendsList =
            widget!.chatRef!.users.toList().cast<DocumentReference>();
        safeSetState(() {});
      } else {
        // addUser_ToList
        _model.addToFriendsList(currentUserReference!);
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  'ccm5sapc' /* Report a concern */,
                ),
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'k8cf4bvi' /* Select users from below to sta... */,
                  ),
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 4.0),
              child: FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).alternate,
                borderRadius: 12.0,
                borderWidth: 1.0,
                buttonSize: 44.0,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                icon: Icon(
                  Icons.close_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  if (!valueOrDefault<bool>(
                      currentUserDocument?.isSafeGuarding, false))
                    AuthUserStreamWidget(
                      builder: (context) => Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 16.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'zcg05tyw' /* Report Concern */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 0.0, 0.0),
                                  child: Text(
                                    ((valueOrDefault<int>(
                                              _model.friendsList.length,
                                              0,
                                            ) -
                                            1))
                                        .toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      2.0, 12.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'g4a0ukfo' /* Selected */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: PagedListView<DocumentSnapshot<Object?>?,
                                  UsersRecord>(
                                pagingController: _model.setListViewController1(
                                  UsersRecord.collection
                                      .where(
                                        'isSafeGuarding',
                                        isEqualTo: true,
                                      )
                                      .orderBy('display_name'),
                                ),
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  160.0,
                                ),
                                reverse: false,
                                scrollDirection: Axis.vertical,
                                builderDelegate:
                                    PagedChildBuilderDelegate<UsersRecord>(
                                  // Customize what your widget looks like when it's loading the first page.
                                  firstPageProgressIndicatorBuilder: (_) =>
                                      Center(
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
                                  ),
                                  // Customize what your widget looks like when it's loading another page.
                                  newPageProgressIndicatorBuilder: (_) =>
                                      Center(
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
                                  ),
                                  noItemsFoundIndicatorBuilder: (_) =>
                                      EmptyStateSimpleWidget(
                                    icon: Icon(
                                      Icons.groups_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 90.0,
                                    ),
                                    title: FFLocalizations.of(context).getText(
                                      'thjogp8k' /* No Friends */,
                                    ),
                                    body: FFLocalizations.of(context).getText(
                                      'lg9cr8bl' /* No users exist to create a cha... */,
                                    ),
                                  ),
                                  itemBuilder: (context, _, listViewIndex) {
                                    final listViewUsersRecord = _model
                                        .listViewPagingController1!
                                        .itemList![listViewIndex];
                                    return Visibility(
                                      visible: listViewUsersRecord.reference !=
                                          currentUserReference,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 8.0),
                                        child: Container(
                                          width: 100.0,
                                          height: 70.0,
                                          decoration: BoxDecoration(
                                            color: _model.friendsList.contains(
                                                    listViewUsersRecord
                                                        .reference)
                                                ? FlutterFlowTheme.of(context)
                                                    .accent1
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: _model.friendsList
                                                      .contains(
                                                          listViewUsersRecord
                                                              .reference)
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 44.0,
                                                  height: 44.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: CachedNetworkImage(
                                                        fadeInDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    200),
                                                        fadeOutDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    200),
                                                        imageUrl:
                                                            listViewUsersRecord
                                                                .photoUrl,
                                                        width: 44.0,
                                                        height: 44.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Theme(
                                                  data: ThemeData(
                                                    unselectedWidgetColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  child: CheckboxListTile(
                                                    value: _model
                                                            .checkboxListTileValueMap1[
                                                        listViewUsersRecord] ??= _model
                                                            .friendsList
                                                            .contains(
                                                                listViewUsersRecord
                                                                    .reference) ==
                                                        true,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() => _model
                                                                  .checkboxListTileValueMap1[
                                                              listViewUsersRecord] =
                                                          newValue!);
                                                      if (newValue!) {
                                                        // addUser
                                                        _model.addToFriendsList(
                                                            listViewUsersRecord
                                                                .reference);
                                                        safeSetState(() {});
                                                      } else {
                                                        // removeUsser
                                                        _model.addToFriendsList(
                                                            listViewUsersRecord
                                                                .reference);
                                                        safeSetState(() {});
                                                      }
                                                    },
                                                    title: Text(
                                                      valueOrDefault<String>(
                                                        listViewUsersRecord
                                                            .displayName,
                                                        'Ghost User',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                            lineHeight: 2.0,
                                                          ),
                                                    ),
                                                    subtitle: Text(
                                                      valueOrDefault<String>(
                                                        listViewUsersRecord
                                                            .email,
                                                        'casper@ghost.io',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    tileColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    checkColor: Colors.white,
                                                    dense: false,
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .trailing,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                8.0, 0.0),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
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
                      height: 140.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).accent4,
                            FlutterFlowTheme.of(context).secondaryBackground
                          ],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (_model.friendsList.length >= 2) {
                              if (widget!.chatRef != null) {
                                // updateChat

                                await widget!.chatRef!.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'users': _model.friendsList,
                                    },
                                  ),
                                });
                                // updateChat
                                _model.updatedChatThread =
                                    await queryChatsRecordOnce(
                                  queryBuilder: (chatsRecord) =>
                                      chatsRecord.where(
                                    'group_chat_id',
                                    isEqualTo: widget!.chatRef?.groupChatId,
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                if (Navigator.of(context).canPop()) {
                                  context.pop();
                                }
                                context.pushNamed(
                                  'chat_2_Details',
                                  queryParameters: {
                                    'chatRef': serializeParam(
                                      _model.updatedChatThread,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'chatRef': _model.updatedChatThread,
                                  },
                                );
                              } else {
                                // newChat

                                var chatsRecordReference =
                                    ChatsRecord.collection.doc();
                                await chatsRecordReference.set({
                                  ...createChatsRecordData(
                                    userA: currentUserReference,
                                    userB: _model.friendsList[1],
                                    lastMessage: '',
                                    lastMessageTime: getCurrentTimestamp,
                                    lastMessageSentBy: currentUserReference,
                                    groupChatId: random_data.randomInteger(
                                        1000000, 9999999),
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'users': _model.friendsList,
                                    },
                                  ),
                                });
                                _model.newChatThread =
                                    ChatsRecord.getDocumentFromData({
                                  ...createChatsRecordData(
                                    userA: currentUserReference,
                                    userB: _model.friendsList[1],
                                    lastMessage: '',
                                    lastMessageTime: getCurrentTimestamp,
                                    lastMessageSentBy: currentUserReference,
                                    groupChatId: random_data.randomInteger(
                                        1000000, 9999999),
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'users': _model.friendsList,
                                    },
                                  ),
                                }, chatsRecordReference);
                                if (Navigator.of(context).canPop()) {
                                  context.pop();
                                }
                                context.pushNamed(
                                  'chat_2_Details',
                                  queryParameters: {
                                    'chatRef': serializeParam(
                                      _model.newChatThread,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'chatRef': _model.newChatThread,
                                  },
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'You must select at least one other user to start a chat.',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  duration: Duration(milliseconds: 3000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              );
                            }

                            safeSetState(() {});
                          },
                          text: widget!.chatRef != null
                              ? 'Add to Chat'
                              : 'Send Invites',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (valueOrDefault<bool>(
                      currentUserDocument?.isSafeGuarding, false))
                    AuthUserStreamWidget(
                      builder: (context) => Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 16.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '8t8mkek3' /* Report Concern */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 0.0, 0.0),
                                  child: Text(
                                    ((valueOrDefault<int>(
                                              _model.friendsList.length,
                                              0,
                                            ) -
                                            1))
                                        .toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      2.0, 12.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'po897hp0' /* Selected */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: PagedListView<DocumentSnapshot<Object?>?,
                                  UsersRecord>(
                                pagingController: _model.setListViewController2(
                                  UsersRecord.collection
                                      .where(
                                        'isStudent',
                                        isEqualTo: true,
                                      )
                                      .orderBy('display_name'),
                                ),
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  160.0,
                                ),
                                reverse: false,
                                scrollDirection: Axis.vertical,
                                builderDelegate:
                                    PagedChildBuilderDelegate<UsersRecord>(
                                  // Customize what your widget looks like when it's loading the first page.
                                  firstPageProgressIndicatorBuilder: (_) =>
                                      Center(
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
                                  ),
                                  // Customize what your widget looks like when it's loading another page.
                                  newPageProgressIndicatorBuilder: (_) =>
                                      Center(
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
                                  ),
                                  noItemsFoundIndicatorBuilder: (_) =>
                                      EmptyStateSimpleWidget(
                                    icon: Icon(
                                      Icons.groups_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 90.0,
                                    ),
                                    title: FFLocalizations.of(context).getText(
                                      '5tz8sn15' /* No Friends */,
                                    ),
                                    body: FFLocalizations.of(context).getText(
                                      'xmrz4xul' /* No users exist to create a cha... */,
                                    ),
                                  ),
                                  itemBuilder: (context, _, listViewIndex) {
                                    final listViewUsersRecord = _model
                                        .listViewPagingController2!
                                        .itemList![listViewIndex];
                                    return Visibility(
                                      visible: listViewUsersRecord.reference !=
                                          currentUserReference,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 8.0),
                                        child: Container(
                                          width: 100.0,
                                          height: 70.0,
                                          decoration: BoxDecoration(
                                            color: _model.friendsList.contains(
                                                    listViewUsersRecord
                                                        .reference)
                                                ? FlutterFlowTheme.of(context)
                                                    .accent1
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: _model.friendsList
                                                      .contains(
                                                          listViewUsersRecord
                                                              .reference)
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 44.0,
                                                  height: 44.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: CachedNetworkImage(
                                                        fadeInDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    200),
                                                        fadeOutDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    200),
                                                        imageUrl:
                                                            listViewUsersRecord
                                                                .photoUrl,
                                                        width: 44.0,
                                                        height: 44.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Theme(
                                                  data: ThemeData(
                                                    unselectedWidgetColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  child: CheckboxListTile(
                                                    value: _model
                                                            .checkboxListTileValueMap2[
                                                        listViewUsersRecord] ??= _model
                                                            .friendsList
                                                            .contains(
                                                                listViewUsersRecord
                                                                    .reference) ==
                                                        true,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() => _model
                                                                  .checkboxListTileValueMap2[
                                                              listViewUsersRecord] =
                                                          newValue!);
                                                      if (newValue!) {
                                                        // addUser
                                                        _model.addToFriendsList(
                                                            listViewUsersRecord
                                                                .reference);
                                                        safeSetState(() {});
                                                      } else {
                                                        // removeUsser
                                                        _model.addToFriendsList(
                                                            listViewUsersRecord
                                                                .reference);
                                                        safeSetState(() {});
                                                      }
                                                    },
                                                    title: Text(
                                                      valueOrDefault<String>(
                                                        listViewUsersRecord
                                                            .displayName,
                                                        'Ghost User',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                            lineHeight: 2.0,
                                                          ),
                                                    ),
                                                    subtitle: Text(
                                                      valueOrDefault<String>(
                                                        listViewUsersRecord
                                                            .email,
                                                        'casper@ghost.io',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    tileColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    checkColor: Colors.white,
                                                    dense: false,
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .trailing,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                8.0, 0.0),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
