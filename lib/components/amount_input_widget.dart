import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
export 'amount_input_model.dart';

class AmountInputWidget extends StatefulWidget {
  const AmountInputWidget({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final double value;
  final void Function(double) onChanged;

  @override
  State<AmountInputWidget> createState() => _AmountInputWidgetState();
}

class _AmountInputWidgetState extends State<AmountInputWidget> {
  late final TextEditingController textController;
  late final FocusNode textFieldFocusNode;

  String _convertValue() {
    return formatNumber(
      widget.value,
      formatType: FormatType.decimal,
      decimalType: DecimalType.automatic,
    );
  }

  @override
  void initState() {
    super.initState();

    textController = TextEditingController(text: _convertValue());

    textFieldFocusNode = FocusNode();
    textFieldFocusNode.addListener(() {
      final value = textController.value.text;
      widget.onChanged(double.parse(value));
    });
  }

  @override
  Widget build(BuildContext context) {
    textController.text = _convertValue();

    return Container(
      width: 200.0,
      child: TextFormField(
        controller: textController,
        focusNode: textFieldFocusNode,
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
      ),
    );
  }
}
