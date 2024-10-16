import '/backend/backend.dart';
import '/components/committees_card/committees_card_widget.dart';
import '/components/empty/empty_widget.dart';
import '/components/header/header_widget.dart';
import '/components/project_items/project_items_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'projects_model.dart';
export 'projects_model.dart';

class ProjectsWidget extends StatefulWidget {
  const ProjectsWidget({
    super.key,
    String? pageTitle,
    this.specialOffer,
    bool? showMostRecent,
    bool? showSpecialOffer,
    String? showActiveCategory,
    String? showActiveFolder,
  })  : this.pageTitle = pageTitle ?? 'Most Popular',
        this.showMostRecent = showMostRecent ?? false,
        this.showSpecialOffer = showSpecialOffer ?? false,
        this.showActiveCategory = showActiveCategory ?? 'All',
        this.showActiveFolder = showActiveFolder ?? 'Initiatives';

  final String pageTitle;
  final SpecialOfferRecord? specialOffer;
  final bool showMostRecent;
  final bool showSpecialOffer;
  final String showActiveCategory;
  final String showActiveFolder;

  @override
  State<ProjectsWidget> createState() => _ProjectsWidgetState();
}

class _ProjectsWidgetState extends State<ProjectsWidget> {
  late ProjectsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProjectsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.categori = widget!.showActiveCategory;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
                    title: 'Ongoing Projects',
                    showBackButton: true,
                  ),
                ),
                if (widget!.showSpecialOffer && (widget!.specialOffer != null))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14.0),
                      child: Container(
                        width: double.infinity,
                        height: 150.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: wrapWithModel(
                          model: _model.committeesCardModel,
                          updateCallback: () => safeSetState(() {}),
                          child: CommitteesCardWidget(
                            title: widget!.specialOffer!.title,
                            description: widget!.specialOffer!.description,
                            image: widget!.specialOffer!.image,
                            colour: valueOrDefault<Color>(
                              widget!.specialOffer?.colour,
                              FlutterFlowTheme.of(context).primaryBackground,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (widget!.specialOffer?.reference == null)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowChoiceChips(
                                    options: FFAppState()
                                        .Categories
                                        .map((label) => ChipData(label))
                                        .toList(),
                                    onChanged: (val) async {
                                      safeSetState(() =>
                                          _model.choiceChipsValue1 =
                                              val?.firstOrNull);
                                      _model.categori =
                                          _model.choiceChipsValue1!;
                                      safeSetState(() {});
                                    },
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      iconColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      iconSize: 18.0,
                                      elevation: 0.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      borderWidth: 2.0,
                                      borderRadius: BorderRadius.circular(55.0),
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      iconColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      iconSize: 18.0,
                                      elevation: 0.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      borderWidth: 2.0,
                                      borderRadius: BorderRadius.circular(55.0),
                                    ),
                                    chipSpacing: 12.0,
                                    rowSpacing: 12.0,
                                    multiselect: false,
                                    initialized:
                                        _model.choiceChipsValue1 != null,
                                    alignment: WrapAlignment.start,
                                    controller:
                                        _model.choiceChipsValueController1 ??=
                                            FormFieldController<List<String>>(
                                      [widget!.showActiveCategory],
                                    ),
                                    wrapped: false,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowChoiceChips(
                                  options: FFAppState()
                                      .Folders
                                      .map((label) => ChipData(label))
                                      .toList(),
                                  onChanged: (val) async {
                                    safeSetState(() => _model
                                        .choiceChipsValue2 = val?.firstOrNull);
                                    _model.folder = _model.choiceChipsValue2!;
                                    safeSetState(() {});
                                  },
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                    iconColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    iconSize: 18.0,
                                    elevation: 0.0,
                                    borderColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    borderWidth: 2.0,
                                    borderRadius: BorderRadius.circular(55.0),
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                    iconColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    iconSize: 18.0,
                                    elevation: 0.0,
                                    borderColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    borderWidth: 2.0,
                                    borderRadius: BorderRadius.circular(55.0),
                                  ),
                                  chipSpacing: 12.0,
                                  rowSpacing: 12.0,
                                  multiselect: false,
                                  initialized: _model.choiceChipsValue2 != null,
                                  alignment: WrapAlignment.start,
                                  controller:
                                      _model.choiceChipsValueController2 ??=
                                          FormFieldController<List<String>>(
                                    [widget!.showActiveFolder],
                                  ),
                                  wrapped: false,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (responsiveVisibility(
                  context: context,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  FutureBuilder<List<ProductRecord>>(
                    future: queryProductRecordOnce(),
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
                      List<ProductRecord> containerProductRecordList =
                          snapshot.data!;

                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final product = containerProductRecordList
                                  .where((e) => valueOrDefault<bool>(
                                        () {
                                          if (!widget!.showMostRecent &&
                                              !widget!.showSpecialOffer) {
                                            return (((_model.categori ==
                                                        'All') ||
                                                    (e.category ==
                                                        _model.categori)) &&
                                                (e.folder == _model.folder));
                                          } else if (widget!.showMostRecent) {
                                            return (((_model.categori ==
                                                        'All') ||
                                                    (e.category ==
                                                        _model.categori)) &&
                                                e.recent &&
                                                (e.folder == _model.folder));
                                          } else if (widget!.showSpecialOffer &&
                                              (widget!.specialOffer != null)) {
                                            return (e.specialOffer &&
                                                (e.specialOfferRef ==
                                                    widget!.specialOffer
                                                        ?.reference) &&
                                                ((_model.categori == 'All') ||
                                                    (e.category ==
                                                        _model.categori)) &&
                                                (e.folder == _model.folder));
                                          } else if (widget!.showSpecialOffer) {
                                            return (((_model.categori ==
                                                        'All') ||
                                                    (e.category ==
                                                        _model.categori)) &&
                                                e.specialOffer &&
                                                (e.folder == _model.folder));
                                          } else {
                                            return true;
                                          }
                                        }(),
                                        true,
                                      ))
                                  .toList();
                              if (product.isEmpty) {
                                return EmptyWidget(
                                  icon: Icon(
                                    Icons.cancel,
                                    size: 32.0,
                                  ),
                                  title: 'No Project!',
                                  body: 'There is no project in this category',
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
                                itemBuilder: (context, productIndex) {
                                  final productItem = product[productIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'Detail',
                                        queryParameters: {
                                          'product': serializeParam(
                                            productItem,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'product': productItem,
                                        },
                                      );
                                    },
                                    child: ProjectItemsWidget(
                                      key: Key(
                                          'Key9je_${productIndex}_of_${product.length}'),
                                      image: productItem
                                          .productInformation.projectCover,
                                      itemName:
                                          productItem.productInformation.name,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  desktop: false,
                ))
                  FutureBuilder<List<ProductRecord>>(
                    future: queryProductRecordOnce(),
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
                      List<ProductRecord> containerProductRecordList =
                          snapshot.data!;

                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final product = containerProductRecordList
                                  .where((e) => valueOrDefault<bool>(
                                        () {
                                          if (!widget!.showMostRecent &&
                                              !widget!.showSpecialOffer) {
                                            return (((_model.categori ==
                                                        'All') ||
                                                    (e.category ==
                                                        _model.categori)) &&
                                                (e.folder == _model.folder));
                                          } else if (widget!.showMostRecent) {
                                            return (((_model.categori ==
                                                        'All') ||
                                                    (e.category ==
                                                        _model.categori)) &&
                                                e.recent &&
                                                (e.folder == _model.folder));
                                          } else if (widget!.showSpecialOffer &&
                                              (widget!.specialOffer != null)) {
                                            return (e.specialOffer &&
                                                (e.specialOfferRef ==
                                                    widget!.specialOffer
                                                        ?.reference) &&
                                                ((_model.categori == 'All') ||
                                                    (e.category ==
                                                        _model.categori)) &&
                                                (e.folder == _model.folder));
                                          } else if (widget!.showSpecialOffer) {
                                            return (((_model.categori ==
                                                        'All') ||
                                                    (e.category ==
                                                        _model.categori)) &&
                                                e.specialOffer &&
                                                (e.folder == _model.folder));
                                          } else {
                                            return true;
                                          }
                                        }(),
                                        true,
                                      ))
                                  .toList();
                              if (product.isEmpty) {
                                return EmptyWidget(
                                  icon: Icon(
                                    Icons.cancel,
                                    size: 32.0,
                                  ),
                                  title: 'No Project!',
                                  body:
                                      'There is no project in this category at the moment',
                                  customAction: () async {},
                                );
                              }

                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10.0,
                                  childAspectRatio: 0.85,
                                ),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: product.length,
                                itemBuilder: (context, productIndex) {
                                  final productItem = product[productIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'Detail',
                                        queryParameters: {
                                          'product': serializeParam(
                                            productItem,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'product': productItem,
                                        },
                                      );
                                    },
                                    child: ProjectItemsWidget(
                                      key: Key(
                                          'Keyx61_${productIndex}_of_${product.length}'),
                                      image: productItem
                                          .productInformation.projectCover,
                                      itemName:
                                          productItem.productInformation.name,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                ))
                  FutureBuilder<List<ProductRecord>>(
                    future: queryProductRecordOnce(),
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
                      List<ProductRecord> containerProductRecordList =
                          snapshot.data!;

                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final product = containerProductRecordList
                                  .where((e) => valueOrDefault<bool>(
                                        () {
                                          if (!widget!.showMostRecent &&
                                              !widget!.showSpecialOffer) {
                                            return (((_model.categori ==
                                                        'All') ||
                                                    (e.category ==
                                                        _model.categori)) &&
                                                (e.folder == _model.folder));
                                          } else if (widget!.showMostRecent) {
                                            return (((_model.categori ==
                                                        'All') ||
                                                    (e.category ==
                                                        _model.categori)) &&
                                                e.recent &&
                                                (e.folder == _model.folder));
                                          } else if (widget!.showSpecialOffer &&
                                              (widget!.specialOffer != null)) {
                                            return (e.specialOffer &&
                                                (e.specialOfferRef ==
                                                    widget!.specialOffer
                                                        ?.reference) &&
                                                ((_model.categori == 'All') ||
                                                    (e.category ==
                                                        _model.categori)) &&
                                                (e.folder == _model.folder));
                                          } else if (widget!.showSpecialOffer) {
                                            return (((_model.categori ==
                                                        'All') ||
                                                    (e.category ==
                                                        _model.categori)) &&
                                                e.specialOffer &&
                                                (e.folder == _model.folder));
                                          } else {
                                            return true;
                                          }
                                        }(),
                                        true,
                                      ))
                                  .toList();
                              if (product.isEmpty) {
                                return EmptyWidget(
                                  icon: Icon(
                                    Icons.cancel,
                                    size: 32.0,
                                  ),
                                  title: 'No Project!',
                                  body:
                                      'There is no project in this category at the moment.',
                                  customAction: () async {},
                                );
                              }

                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                  crossAxisSpacing: 10.0,
                                  childAspectRatio: 0.95,
                                ),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: product.length,
                                itemBuilder: (context, productIndex) {
                                  final productItem = product[productIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'Detail',
                                        queryParameters: {
                                          'product': serializeParam(
                                            productItem,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'product': productItem,
                                        },
                                      );
                                    },
                                    child: ProjectItemsWidget(
                                      key: Key(
                                          'Keyzc0_${productIndex}_of_${product.length}'),
                                      image: productItem
                                          .productInformation.projectCover,
                                      itemName:
                                          productItem.productInformation.name,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
              ].addToEnd(SizedBox(height: 24.0)),
            ),
          ),
        ),
      ),
    );
  }
}
