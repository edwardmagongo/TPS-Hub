import '/backend/backend.dart';
import '/components/committees_card/committees_card_widget.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'committees_model.dart';
export 'committees_model.dart';

class CommitteesWidget extends StatefulWidget {
  const CommitteesWidget({super.key});

  @override
  State<CommitteesWidget> createState() => _CommitteesWidgetState();
}

class _CommitteesWidgetState extends State<CommitteesWidget> {
  late CommitteesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommitteesModel());

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                wrapWithModel(
                  model: _model.headerModel,
                  updateCallback: () => safeSetState(() {}),
                  child: HeaderWidget(
                    title: FFLocalizations.of(context).getText(
                      'h7pm8ha0' /* Committees */,
                    ),
                    showBackButton: true,
                  ),
                ),
                FutureBuilder<List<SpecialOfferRecord>>(
                  future: FFAppState().productHasSpecialOffer(
                    requestFn: () => querySpecialOfferRecordOnce(),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 44.0,
                          height: 44.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<SpecialOfferRecord> listViewSpecialOfferRecordList =
                        snapshot.data!;

                    return ListView.separated(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        24.0,
                        0,
                        24.0,
                      ),
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewSpecialOfferRecordList.length,
                      separatorBuilder: (_, __) => SizedBox(height: 16.0),
                      itemBuilder: (context, listViewIndex) {
                        final listViewSpecialOfferRecord =
                            listViewSpecialOfferRecordList[listViewIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: FutureBuilder<SpecialOfferRecord>(
                            future: FFAppState().specialOfferSingleProductRef(
                              uniqueQueryKey: valueOrDefault<String>(
                                listViewSpecialOfferRecord.reference.id,
                                'productID',
                              ),
                              requestFn: () =>
                                  SpecialOfferRecord.getDocumentOnce(
                                      listViewSpecialOfferRecord.reference),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 44.0,
                                    height: 44.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }

                              final committeesCardSpecialOfferRecord =
                                  snapshot.data!;

                              return CommitteesCardWidget(
                                key: Key(
                                    'Key9kq_${listViewIndex}_of_${listViewSpecialOfferRecordList.length}'),
                                title: committeesCardSpecialOfferRecord.title,
                                description: committeesCardSpecialOfferRecord
                                    .description,
                                image: committeesCardSpecialOfferRecord.image,
                                colour: valueOrDefault<Color>(
                                  committeesCardSpecialOfferRecord.colour,
                                  FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
