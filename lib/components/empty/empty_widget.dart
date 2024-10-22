import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_model.dart';
export 'empty_model.dart';

class EmptyWidget extends StatefulWidget {
  const EmptyWidget({
    super.key,
    this.icon,
    this.title,
    this.body,
    bool? hasAction,
    this.actionButtonText,
    this.customAction,
  }) : this.hasAction = hasAction ?? false;

  final Widget? icon;
  final String? title;
  final String? body;
  final bool hasAction;
  final String? actionButtonText;
  final Future Function()? customAction;

  @override
  State<EmptyWidget> createState() => _EmptyWidgetState();
}

class _EmptyWidgetState extends State<EmptyWidget> {
  late EmptyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget!.icon != null)
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget!.icon!,
              ],
            ),
          if (widget!.title != null && widget!.title != '')
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    widget!.title!,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
          if (widget!.body != null && widget!.body != '')
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget!.body,
                    'No data.',
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).grayTextMiddle,
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          if (widget!.hasAction)
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    await widget.customAction?.call();
                  },
                  text: widget!.actionButtonText!,
                  options: FFButtonOptions(
                    height: 44.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).buttonBlack,
                    textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Inter',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          letterSpacing: 0.0,
                        ),
                    elevation: 10.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            ),
        ].divide(SizedBox(height: 16.0)),
      ),
    );
  }
}
