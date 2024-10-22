import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'committee_members_model.dart';
export 'committee_members_model.dart';

class CommitteeMembersWidget extends StatefulWidget {
  const CommitteeMembersWidget({
    super.key,
    required this.members,
    required this.defaultValue,
  });

  final List<String>? members;
  final String? defaultValue;

  @override
  State<CommitteeMembersWidget> createState() => _CommitteeMembersWidgetState();
}

class _CommitteeMembersWidgetState extends State<CommitteeMembersWidget> {
  late CommitteeMembersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommitteeMembersModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final member = widget!.members!.toList();

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: List.generate(member.length, (memberIndex) {
              final memberItem = member[memberIndex];
              return Container(
                width: 150.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          memberItem,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          minFontSize: 11.0,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).divide(SizedBox(width: 8.0)),
          ),
        );
      },
    );
  }
}
