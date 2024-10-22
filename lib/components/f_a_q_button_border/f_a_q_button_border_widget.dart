import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'f_a_q_button_border_model.dart';
export 'f_a_q_button_border_model.dart';

class FAQButtonBorderWidget extends StatefulWidget {
  const FAQButtonBorderWidget({
    super.key,
    this.title,
  });

  final String? title;

  @override
  State<FAQButtonBorderWidget> createState() => _FAQButtonBorderWidgetState();
}

class _FAQButtonBorderWidgetState extends State<FAQButtonBorderWidget> {
  late FAQButtonBorderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FAQButtonBorderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () {
        print('Button pressed ...');
      },
      text: widget!.title!,
      options: FFButtonOptions(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 8.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).primaryBackground,
        textStyle: FlutterFlowTheme.of(context).labelMedium.override(
              fontFamily: 'Inter',
              color: FlutterFlowTheme.of(context).primaryText,
              letterSpacing: 0.0,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).primaryText,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(100.0),
      ),
    );
  }
}
