import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chech_box_icon_model.dart';
export 'chech_box_icon_model.dart';

class ChechBoxIconWidget extends StatefulWidget {
  const ChechBoxIconWidget({
    super.key,
    bool? initialValue,
    bool? disable,
  })  : this.initialValue = initialValue ?? false,
        this.disable = disable ?? false;

  final bool initialValue;
  final bool disable;

  @override
  State<ChechBoxIconWidget> createState() => _ChechBoxIconWidgetState();
}

class _ChechBoxIconWidgetState extends State<ChechBoxIconWidget> {
  late ChechBoxIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChechBoxIconModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.checked = widget!.initialValue;
      _model.updatePage(() {});
    });

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
      width: 44.0,
      height: 44.0,
      decoration: BoxDecoration(),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            if (!widget!.disable)
              ToggleIcon(
                onPressed: () async {
                  safeSetState(() => _model.checked = !_model.checked);
                },
                value: _model.checked,
                onIcon: Icon(
                  Icons.check_box_sharp,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 25.0,
                ),
                offIcon: Icon(
                  Icons.square_outlined,
                  color: FlutterFlowTheme.of(context).grayTextMiddle,
                  size: 25.0,
                ),
              ),
            if (widget!.disable)
              Container(
                width: 44.0,
                height: 44.0,
                child: Stack(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  children: [
                    if (!widget!.initialValue)
                      Icon(
                        Icons.square_outlined,
                        color: FlutterFlowTheme.of(context).accent3,
                        size: 24.0,
                      ),
                    if (widget!.initialValue)
                      FaIcon(
                        FontAwesomeIcons.checkSquare,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
