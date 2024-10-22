import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'languages_item_model.dart';
export 'languages_item_model.dart';

class LanguagesItemWidget extends StatefulWidget {
  const LanguagesItemWidget({
    super.key,
    required this.text,
    bool? currentLanguage,
  }) : this.currentLanguage = currentLanguage ?? false;

  final String? text;
  final bool currentLanguage;

  @override
  State<LanguagesItemWidget> createState() => _LanguagesItemWidgetState();
}

class _LanguagesItemWidgetState extends State<LanguagesItemWidget> {
  late LanguagesItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LanguagesItemModel());

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
      height: 60.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).tfBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                widget!.text!,
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            if (widget!.currentLanguage)
              FaIcon(
                FontAwesomeIcons.square,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 28.0,
              ),
          ],
        ),
      ),
    );
  }
}
