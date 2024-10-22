import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty/empty_widget.dart';
import '/components/header/header_widget.dart';
import '/components/project_items/project_items_widget.dart';
import '/components/sidenav/sidenav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'favourites_model.dart';
export 'favourites_model.dart';

class FavouritesWidget extends StatefulWidget {
  const FavouritesWidget({super.key});

  @override
  State<FavouritesWidget> createState() => _FavouritesWidgetState();
}

class _FavouritesWidgetState extends State<FavouritesWidget> {
  late FavouritesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavouritesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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

        final favouritesUsersRecord = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                        navSelected: 5,
                      ),
                    ),
                  Expanded(
                    child: Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            wrapWithModel(
                              model: _model.headerModel,
                              updateCallback: () => safeSetState(() {}),
                              child: HeaderWidget(
                                title: FFLocalizations.of(context).getText(
                                  '62s61p38' /* My Liked Committees */,
                                ),
                                showBackButton: true,
                              ),
                            ),
                            if (responsiveVisibility(
                              context: context,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final product =
                                                favouritesUsersRecord
                                                    .productsLiked
                                                    .toList();
                                            if (product.isEmpty) {
                                              return EmptyWidget(
                                                body:
                                                    'Your favourites list is empty',
                                                customAction: () async {},
                                              );
                                            }

                                            return GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 10.0,
                                                mainAxisSpacing: 10.0,
                                                childAspectRatio: 0.7,
                                              ),
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: product.length,
                                              itemBuilder:
                                                  (context, productIndex) {
                                                final productItem =
                                                    product[productIndex];
                                                return FutureBuilder<
                                                    ProductRecord>(
                                                  future: ProductRecord
                                                      .getDocumentOnce(
                                                          productItem),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 44.0,
                                                          height: 44.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }

                                                    final projectItemsProductRecord =
                                                        snapshot.data!;

                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'Detail',
                                                          queryParameters: {
                                                            'product':
                                                                serializeParam(
                                                              projectItemsProductRecord,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'product':
                                                                projectItemsProductRecord,
                                                          },
                                                        );
                                                      },
                                                      child: ProjectItemsWidget(
                                                        key: Key(
                                                            'Key9x4_${productIndex}_of_${product.length}'),
                                                        image: projectItemsProductRecord
                                                            .productInformation
                                                            .projectCover,
                                                        itemName:
                                                            projectItemsProductRecord
                                                                .productInformation
                                                                .name,
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(height: 16.0))
                                        .addToEnd(SizedBox(height: 24.0)),
                                  ),
                                ),
                              ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              desktop: false,
                            ))
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final product =
                                                favouritesUsersRecord
                                                    .productsLiked
                                                    .toList();
                                            if (product.isEmpty) {
                                              return EmptyWidget(
                                                body:
                                                    'Your favourites list is empty',
                                                customAction: () async {},
                                              );
                                            }

                                            return GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                crossAxisSpacing: 10.0,
                                                childAspectRatio: 1.0,
                                              ),
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: product.length,
                                              itemBuilder:
                                                  (context, productIndex) {
                                                final productItem =
                                                    product[productIndex];
                                                return FutureBuilder<
                                                    ProductRecord>(
                                                  future: ProductRecord
                                                      .getDocumentOnce(
                                                          productItem),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 44.0,
                                                          height: 44.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }

                                                    final projectItemsProductRecord =
                                                        snapshot.data!;

                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'Detail',
                                                          queryParameters: {
                                                            'product':
                                                                serializeParam(
                                                              projectItemsProductRecord,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'product':
                                                                projectItemsProductRecord,
                                                          },
                                                        );
                                                      },
                                                      child: ProjectItemsWidget(
                                                        key: Key(
                                                            'Keyc1j_${productIndex}_of_${product.length}'),
                                                        image: projectItemsProductRecord
                                                            .productInformation
                                                            .projectCover,
                                                        itemName:
                                                            projectItemsProductRecord
                                                                .productInformation
                                                                .name,
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(height: 16.0))
                                        .addToEnd(SizedBox(height: 24.0)),
                                  ),
                                ),
                              ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                            ))
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final product =
                                                favouritesUsersRecord
                                                    .productsLiked
                                                    .toList();
                                            if (product.isEmpty) {
                                              return EmptyWidget(
                                                body:
                                                    'Your favourites list is empty',
                                                customAction: () async {},
                                              );
                                            }

                                            return GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 4,
                                                crossAxisSpacing: 10.0,
                                                childAspectRatio: 1.2,
                                              ),
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: product.length,
                                              itemBuilder:
                                                  (context, productIndex) {
                                                final productItem =
                                                    product[productIndex];
                                                return FutureBuilder<
                                                    ProductRecord>(
                                                  future: ProductRecord
                                                      .getDocumentOnce(
                                                          productItem),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 44.0,
                                                          height: 44.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }

                                                    final projectItemsProductRecord =
                                                        snapshot.data!;

                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'Detail',
                                                          queryParameters: {
                                                            'product':
                                                                serializeParam(
                                                              projectItemsProductRecord,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'product':
                                                                projectItemsProductRecord,
                                                          },
                                                        );
                                                      },
                                                      child: ProjectItemsWidget(
                                                        key: Key(
                                                            'Keypiy_${productIndex}_of_${product.length}'),
                                                        image: projectItemsProductRecord
                                                            .productInformation
                                                            .projectCover,
                                                        itemName:
                                                            projectItemsProductRecord
                                                                .productInformation
                                                                .name,
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(height: 16.0))
                                        .addToEnd(SizedBox(height: 24.0)),
                                  ),
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
    );
  }
}
