import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'na_bar_item_model.dart';
export 'na_bar_item_model.dart';

class NaBarItemWidget extends StatefulWidget {
  const NaBarItemWidget({
    super.key,
    String? actiePage,
    String? currentItemName,
    required this.unselectedIcon,
    required this.selectedIcon,
  })  : this.actiePage = actiePage ?? 'Home',
        this.currentItemName = currentItemName ?? 'Home';

  final String actiePage;
  final String currentItemName;
  final Widget? unselectedIcon;
  final Widget? selectedIcon;

  @override
  State<NaBarItemWidget> createState() => _NaBarItemWidgetState();
}

class _NaBarItemWidgetState extends State<NaBarItemWidget> {
  late NaBarItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NaBarItemModel());

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
      height: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            children: [
              if (widget!.actiePage != widget!.currentItemName)
                widget!.unselectedIcon!,
              if (widget!.actiePage == widget!.currentItemName)
                widget!.selectedIcon!,
            ],
          ),
          Text(
            widget!.currentItemName,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: valueOrDefault<Color>(
                    widget!.actiePage == widget!.currentItemName
                        ? FlutterFlowTheme.of(context).primaryText
                        : FlutterFlowTheme.of(context).secondaryText,
                    FlutterFlowTheme.of(context).secondaryText,
                  ),
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                ),
          ),
        ],
      ),
    );
  }
}
