import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/avatar_with_update/avatar_with_update_widget.dart';
import '/components/birthday_update/birthday_update_widget.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/modals/on_board_complete_modal/on_board_complete_modal_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'on_board_profile_model.dart';
export 'on_board_profile_model.dart';

class OnBoardProfileWidget extends StatefulWidget {
  const OnBoardProfileWidget({super.key});

  @override
  State<OnBoardProfileWidget> createState() => _OnBoardProfileWidgetState();
}

class _OnBoardProfileWidgetState extends State<OnBoardProfileWidget> {
  late OnBoardProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnBoardProfileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.currentAppSetting = await queryAppSettingRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.listOfUserNames =
          _model.currentAppSetting!.userNames.toList().cast<String>();
      safeSetState(() {});
    });

    _model.fullNameTextFieldTextController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.fullNameTextFieldFocusNode ??= FocusNode();

    _model.tfUserNameTextController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.userName, ''));
    _model.tfUserNameFocusNode ??= FocusNode();

    _model.emailTextFieldTextController ??=
        TextEditingController(text: currentUserEmail);
    _model.emailTextFieldFocusNode ??= FocusNode();

    _model.bioTextFieldTextController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.bio, ''));
    _model.bioTextFieldFocusNode ??= FocusNode();

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
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    wrapWithModel(
                      model: _model.headerModel,
                      updateCallback: () => safeSetState(() {}),
                      child: HeaderWidget(
                        title: FFLocalizations.of(context).getText(
                          '91bw3rji' /* Complete Your Profile */,
                        ),
                        showBackButton: false,
                      ),
                    ),
                    Expanded(
                      child: Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 24.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          AuthUserStreamWidget(
                                            builder: (context) => wrapWithModel(
                                              model:
                                                  _model.avatarWithUpdateModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              updateOnChange: true,
                                              child: AvatarWithUpdateWidget(
                                                avatar: valueOrDefault<String>(
                                                  currentUserPhoto,
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/netron-e-com-mobile-6rhojr/assets/l260dcr57pr2/user-default.png',
                                                ),
                                                updateEnable: true,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    AuthUserStreamWidget(
                                      builder: (context) => TextFormField(
                                        controller: _model
                                            .fullNameTextFieldTextController,
                                        focusNode:
                                            _model.fullNameTextFieldFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Urbanist',
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: false,
                                                  ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            '0j9b3tya' /* Full Name */,
                                          ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Urbanist',
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: false,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .tfBackground,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Urbanist',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        validator: _model
                                            .fullNameTextFieldTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        AuthUserStreamWidget(
                                          builder: (context) => TextFormField(
                                            controller:
                                                _model.tfUserNameTextController,
                                            focusNode:
                                                _model.tfUserNameFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.tfUserNameTextController',
                                              Duration(milliseconds: 200),
                                              () => safeSetState(() {}),
                                            ),
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Urbanist',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '6pd5svw3' /* User Name */,
                                              ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Urbanist',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tfBackground,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                              suffixIcon: Icon(
                                                Icons.personal_injury_outlined,
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Urbanist',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                            validator: _model
                                                .tfUserNameTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                () {
                                                  if (_model.tfUserNameTextController
                                                              .text ==
                                                          null ||
                                                      _model.tfUserNameTextController
                                                              .text ==
                                                          '') {
                                                    return 'Choice a unique user name';
                                                  } else if (_model
                                                      .listOfUserNames
                                                      .contains(_model
                                                          .tfUserNameTextController
                                                          .text)) {
                                                    return 'Not available';
                                                  } else {
                                                    return 'Available';
                                                  }
                                                }(),
                                                'Available',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color:
                                                        valueOrDefault<Color>(
                                                      () {
                                                        if (_model.tfUserNameTextController
                                                                    .text ==
                                                                null ||
                                                            _model.tfUserNameTextController
                                                                    .text ==
                                                                '') {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .grayTextMiddle;
                                                        } else if (_model
                                                            .listOfUserNames
                                                            .contains(_model
                                                                .tfUserNameTextController
                                                                .text)) {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .error;
                                                        } else {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .success;
                                                        }
                                                      }(),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .grayTextMiddle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ].divide(SizedBox(height: 5.0)),
                                    ),
                                    TextFormField(
                                      controller:
                                          _model.emailTextFieldTextController,
                                      focusNode: _model.emailTextFieldFocusNode,
                                      autofocus: false,
                                      readOnly: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Urbanist',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'jkvasdhi' /* Email */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Urbanist',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .tfBackground,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 0.0, 0.0),
                                        suffixIcon: Icon(
                                          Icons.mail,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Urbanist',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      keyboardType: TextInputType.emailAddress,
                                      validator: _model
                                          .emailTextFieldTextControllerValidator
                                          .asValidator(context),
                                    ),
                                    AuthUserStreamWidget(
                                      builder: (context) => wrapWithModel(
                                        model: _model.birthdayUpdateModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        updateOnChange: true,
                                        child: BirthdayUpdateWidget(
                                          birthday:
                                              currentUserDocument?.dateOfBirth,
                                        ),
                                      ),
                                    ),
                                    AuthUserStreamWidget(
                                      builder: (context) =>
                                          FlutterFlowDropDown<String>(
                                        controller:
                                            _model.ddGenderValueController ??=
                                                FormFieldController<String>(
                                          _model.ddGenderValue ??=
                                              valueOrDefault(
                                                  currentUserDocument?.gender,
                                                  ''),
                                        ),
                                        options: [
                                          FFLocalizations.of(context).getText(
                                            'wkhri8fk' /* Male */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'oaisacjy' /* Female */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'r08pyo3b' /* Other */,
                                          )
                                        ],
                                        onChanged: (val) => safeSetState(
                                            () => _model.ddGenderValue = val),
                                        height: 50.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Urbanist',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'tmuiwm99' /* Gender */,
                                        ),
                                        icon: FaIcon(
                                          FontAwesomeIcons.caretDown,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 20.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .tfBackground,
                                        elevation: 2.0,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (valueOrDefault<bool>(
                                            currentUserDocument?.isStudent,
                                            false))
                                          AuthUserStreamWidget(
                                            builder: (context) => TextFormField(
                                              controller: _model
                                                  .bioTextFieldTextController,
                                              focusNode:
                                                  _model.bioTextFieldFocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Urbanist',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'om3iob1g' /* Bio */,
                                                ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Urbanist',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tfBackground,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(10.0, 20.0,
                                                            0.0, 0.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Urbanist',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                              maxLines: 3,
                                              validator: _model
                                                  .bioTextFieldTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ]
                                      .divide(SizedBox(height: 16.0))
                                      .addToStart(SizedBox(height: 24.0)),
                                ),
                              ),
                            ].addToEnd(SizedBox(height: 77.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.01),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: ((_model.tfUserNameTextController.text ==
                                      null ||
                                  _model.tfUserNameTextController.text == '') ||
                              _model.listOfUserNames.contains(
                                  _model.tfUserNameTextController.text))
                          ? null
                          : () async {
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }

                              await currentUserReference!
                                  .update(createUsersRecordData(
                                photoUrl:
                                    _model.avatarWithUpdateModel.avatarURL,
                                displayName:
                                    _model.fullNameTextFieldTextController.text,
                                userName: _model.tfUserNameTextController.text,
                                gender: _model.ddGenderValue,
                                dateOfBirth: _model
                                            .birthdayUpdateModel.birthdayDate !=
                                        null
                                    ? _model.birthdayUpdateModel.birthdayDate
                                    : getCurrentTimestamp,
                                bio: _model.bioTextFieldTextController.text,
                                isStudent: false,
                              ));
                              if (currentUserDocument?.cartRef == null) {
                                var cartRecordReference =
                                    CartRecord.collection.doc();
                                await cartRecordReference
                                    .set(createCartRecordData(
                                  userRef: currentUserReference,
                                ));
                                _model.cartCreatedForUser =
                                    CartRecord.getDocumentFromData(
                                        createCartRecordData(
                                          userRef: currentUserReference,
                                        ),
                                        cartRecordReference);

                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  cartRef: _model.cartCreatedForUser?.reference,
                                ));
                              }

                              await currentUserReference!
                                  .update(createUsersRecordData(
                                onboardingFinished: true,
                              ));
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () =>
                                        FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: OnBoardCompleteModalWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));

                              safeSetState(() {});
                            },
                      text: FFLocalizations.of(context).getText(
                        'qpeypoks' /* Continue */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 54.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).buttonBlack,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyLarge.override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 10.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                        disabledColor:
                            FlutterFlowTheme.of(context).grayTextMiddle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
