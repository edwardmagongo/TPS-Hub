import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'contact_us_items_model.dart';
export 'contact_us_items_model.dart';

class ContactUsItemsWidget extends StatefulWidget {
  const ContactUsItemsWidget({
    super.key,
    this.icon,
    required this.title,
  });

  final Widget? icon;
  final String? title;

  @override
  State<ContactUsItemsWidget> createState() => _ContactUsItemsWidgetState();
}

class _ContactUsItemsWidgetState extends State<ContactUsItemsWidget> {
  late ContactUsItemsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContactUsItemsModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              widget!.icon!,
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: Text(
                    widget!.title!,
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
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
