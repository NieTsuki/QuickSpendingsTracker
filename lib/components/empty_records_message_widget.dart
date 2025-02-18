import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_records_message_model.dart';
export 'empty_records_message_model.dart';

class EmptyRecordsMessageWidget extends StatefulWidget {
  const EmptyRecordsMessageWidget({super.key});

  @override
  State<EmptyRecordsMessageWidget> createState() =>
      _EmptyRecordsMessageWidgetState();
}

class _EmptyRecordsMessageWidgetState extends State<EmptyRecordsMessageWidget> {
  late EmptyRecordsMessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyRecordsMessageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
        child: Text(
          'No Records Yet',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Urbanist',
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 16.0,
                letterSpacing: 0.0,
              ),
        ),
      ),
    );
  }
}
