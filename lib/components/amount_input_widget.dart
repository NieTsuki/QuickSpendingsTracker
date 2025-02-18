import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'amount_input_model.dart';
export 'amount_input_model.dart';

class AmountInputWidget extends StatefulWidget {
  const AmountInputWidget({
    super.key,
    this.parameter1,
  });

  final String? parameter1;

  @override
  State<AmountInputWidget> createState() => _AmountInputWidgetState();
}

class _AmountInputWidgetState extends State<AmountInputWidget> {
  late AmountInputModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AmountInputModel());

    _model.textController ??= TextEditingController(text: widget!.parameter1);
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      child: TextFormField(
        controller: _model.textController,
        focusNode: _model.textFieldFocusNode,
        autofocus: false,
        obscureText: false,
        decoration: InputDecoration(
          isDense: true,
          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Manrope',
                letterSpacing: 0.0,
              ),
          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Manrope',
                letterSpacing: 0.0,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Manrope',
              letterSpacing: 0.0,
            ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        cursorColor: FlutterFlowTheme.of(context).primaryText,
        validator: _model.textControllerValidator.asValidator(context),
      ),
    );
  }
}
