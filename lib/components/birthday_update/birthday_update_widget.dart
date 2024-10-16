import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'birthday_update_model.dart';
export 'birthday_update_model.dart';

class BirthdayUpdateWidget extends StatefulWidget {
  const BirthdayUpdateWidget({
    super.key,
    this.birthday,
  });

  final DateTime? birthday;

  @override
  State<BirthdayUpdateWidget> createState() => _BirthdayUpdateWidgetState();
}

class _BirthdayUpdateWidgetState extends State<BirthdayUpdateWidget> {
  late BirthdayUpdateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BirthdayUpdateModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.birthday != null) {
        _model.birthdayDate = widget!.birthday;
        _model.updatePage(() {});
      }
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
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        final _datePickedDate = await showDatePicker(
          context: context,
          initialDate: getCurrentTimestamp,
          firstDate: DateTime(1900),
          lastDate: getCurrentTimestamp,
        );

        if (_datePickedDate != null) {
          safeSetState(() {
            _model.datePicked = DateTime(
              _datePickedDate.year,
              _datePickedDate.month,
              _datePickedDate.day,
            );
          });
        }
        if (_model.datePicked != null) {
          _model.birthdayDate = _model.datePicked;
          _model.updatePage(() {});
        }
      },
      child: Container(
        width: 250.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).tfBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                valueOrDefault<String>(
                  _model.birthdayDate != null
                      ? dateTimeFormat(
                          "yMMMd",
                          _model.birthdayDate,
                          locale: FFLocalizations.of(context).languageCode,
                        )
                      : 'Select Date/Time',
                  'Select Date/Time',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Icon(
              Icons.calendar_month,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            ),
          ].addToStart(SizedBox(width: 10.0)).addToEnd(SizedBox(width: 10.0)),
        ),
      ),
    );
  }
}
