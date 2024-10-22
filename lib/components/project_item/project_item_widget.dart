import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modals/remove_from_card_confirm/remove_from_card_confirm_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'project_item_model.dart';
export 'project_item_model.dart';

class ProjectItemWidget extends StatefulWidget {
  const ProjectItemWidget({
    super.key,
    required this.product,
    this.cartDocument,
  });

  final BookmarkProjectStruct? product;
  final CartRecord? cartDocument;

  @override
  State<ProjectItemWidget> createState() => _ProjectItemWidgetState();
}

class _ProjectItemWidgetState extends State<ProjectItemWidget> {
  late ProjectItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProjectItemModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                widget!.product!.image,
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            valueOrDefault<String>(
                              widget!.product?.name,
                              'Name',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        if (widget!.cartDocument != null)
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 10.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.delete,
                              color: FlutterFlowTheme.of(context).error,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                isDismissible: false,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: RemoveFromCardConfirmWidget(
                                      product: widget!.product!,
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(
                                  () => _model.removeConfirm = value));

                              if (_model.removeConfirm!) {
                                await widget!.cartDocument!.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'products': FieldValue.arrayRemove([
                                        getBookmarkProjectFirestoreData(
                                          updateBookmarkProjectStruct(
                                            widget!.product,
                                            clearUnsetFields: false,
                                          ),
                                          true,
                                        )
                                      ]),
                                    },
                                  ),
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Removed!',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    duration: Duration(milliseconds: 2000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );
                              }

                              safeSetState(() {});
                            },
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
