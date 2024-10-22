import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/loading/loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'on_board_complete_modal_model.dart';
export 'on_board_complete_modal_model.dart';

class OnBoardCompleteModalWidget extends StatefulWidget {
  const OnBoardCompleteModalWidget({super.key});

  @override
  State<OnBoardCompleteModalWidget> createState() =>
      _OnBoardCompleteModalWidgetState();
}

class _OnBoardCompleteModalWidgetState
    extends State<OnBoardCompleteModalWidget> {
  late OnBoardCompleteModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnBoardCompleteModalModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 3000));
      Navigator.pop(context);

      context.goNamed('Home');

      await NotificationsRecord.collection
          .doc()
          .set(createNotificationsRecordData(
            subject: 'Welcome to aTPS Hub!',
            message:
                'Your gateway to staying connected and involved with our school\'s vibrant community. Explore our committees, stay informed about the latest projects, and contribute your voice to make a positive impact. Whether you\'re here to join a cause, report an issue, or stay updated, TPS Hub empowers you to take an active role in shaping our school environment. Let\'s build a safer, more inclusive, and connected community together!',
            userRef: currentUserReference,
            seen: false,
            date: getCurrentTimestamp,
          ));
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacer(),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(44.0, 0.0, 44.0, 0.0),
            child: Container(
              width: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'prn4cih5' /* Congratulations! */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Lottie.network(
                      'https://lottie.host/e594a8be-0a26-4d8f-a706-bfa22ad79779/AKJpwmjWIR.json',
                      width: 200.0,
                      height: 111.0,
                      fit: BoxFit.contain,
                      animate: true,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '7y5lbqhc' /* Your account is ready to use. ... */,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 34.0, 0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.loadingModel,
                        updateCallback: () => safeSetState(() {}),
                        child: LoadingWidget(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
