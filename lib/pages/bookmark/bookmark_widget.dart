import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty/empty_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/project_item/project_item_widget.dart';
import '/components/sidenav/sidenav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bookmark_model.dart';
export 'bookmark_model.dart';

class BookmarkWidget extends StatefulWidget {
  const BookmarkWidget({super.key});

  @override
  State<BookmarkWidget> createState() => _BookmarkWidgetState();
}

class _BookmarkWidgetState extends State<BookmarkWidget> {
  late BookmarkModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookmarkModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<CartRecord>(
        stream: CartRecord.getDocument(currentUserDocument!.cartRef!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Center(
                child: SizedBox(
                  width: 44.0,
                  height: 44.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              ),
            );
          }

          final bookmarkCartRecord = snapshot.data!;

          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: SafeArea(
                top: true,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                    ))
                      wrapWithModel(
                        model: _model.sidenavModel,
                        updateCallback: () => safeSetState(() {}),
                        child: SidenavWidget(
                          navSelected: 2,
                        ),
                      ),
                    Expanded(
                      child: Stack(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '8v6q167c' /* Bookmarked Projects */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          child: Builder(
                                            builder: (context) {
                                              final product = bookmarkCartRecord
                                                  .products
                                                  .toList();
                                              if (product.isEmpty) {
                                                return EmptyWidget(
                                                  icon: Icon(
                                                    FFIcons.kflashSettings,
                                                    size: 32.0,
                                                  ),
                                                  title: 'Empty!',
                                                  body:
                                                      'Your bookmarks are empty, Start adding projects to it.',
                                                  customAction: () async {},
                                                );
                                              }

                                              return ListView.separated(
                                                padding: EdgeInsets.fromLTRB(
                                                  0,
                                                  24.0,
                                                  0,
                                                  100.0,
                                                ),
                                                scrollDirection: Axis.vertical,
                                                itemCount: product.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 16.0),
                                                itemBuilder:
                                                    (context, productIndex) {
                                                  final productItem =
                                                      product[productIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                20.0, 0.0),
                                                    child: ProjectItemWidget(
                                                      key: Key(
                                                          'Keyk7i_${productIndex}_of_${product.length}'),
                                                      product: productItem,
                                                      cartDocument:
                                                          bookmarkCartRecord,
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (responsiveVisibility(
                                      context: context,
                                      desktop: false,
                                    ))
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: wrapWithModel(
                                          model: _model.navBarModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: NavBarWidget(
                                            activePage: '3',
                                          ),
                                        ),
                                      ),
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 20.0, 85.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () async {
                                                context.pushNamed('Home');
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'yy5gzy0a' /* Add Project */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 54.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .buttonBlack,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 10.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
