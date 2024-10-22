import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notification_item_model.dart';
export 'notification_item_model.dart';

class NotificationItemWidget extends StatefulWidget {
  const NotificationItemWidget({
    super.key,
    required this.subject,
    required this.message,
    bool? seen,
  }) : this.seen = seen ?? false;

  final String? subject;
  final String? message;
  final bool seen;

  @override
  State<NotificationItemWidget> createState() => _NotificationItemWidgetState();
}

class _NotificationItemWidgetState extends State<NotificationItemWidget> {
  late NotificationItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationItemModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 68.0,
              height: 68.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryText,
                shape: BoxShape.circle,
              ),
              child: Stack(
                alignment: AlignmentDirectional(0.0, 0.0),
                children: [
                  if (!widget!.seen)
                    Icon(
                      Icons.info,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      size: 28.0,
                    ),
                  if (widget!.seen)
                    FaIcon(
                      FontAwesomeIcons.eye,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      size: 28.0,
                    ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            widget!.subject!,
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              widget!.message!,
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
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
            Container(
              width: 12.0,
              height: 12.0,
              decoration: BoxDecoration(
                color: valueOrDefault<Color>(
                  widget!.seen
                      ? FlutterFlowTheme.of(context).pageViewDots
                      : FlutterFlowTheme.of(context).secondary,
                  FlutterFlowTheme.of(context).secondary,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
