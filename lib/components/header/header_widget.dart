import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'header_model.dart';
export 'header_model.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({
    super.key,
    this.title,
    bool? showBackButton,
  }) : this.showBackButton = showBackButton ?? false;

  final String? title;
  final bool showBackButton;

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  late HeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderModel());

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
      height: 54.0,
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (widget!.showBackButton)
                  FlutterFlowIconButton(
                    buttonSize: 54.0,
                    hoverColor: Colors.transparent,
                    icon: Icon(
                      Icons.chevron_left,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.safePop();
                    },
                  ),
                if (!widget!.showBackButton)
                  Container(
                    width: 20.0,
                    height: 1.0,
                    decoration: BoxDecoration(),
                  ),
              ],
            ),
            if (widget!.title != null && widget!.title != '')
              Expanded(
                child: Text(
                  widget!.title!,
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(),
            ),
          ],
        ),
      ),
    );
  }
}
