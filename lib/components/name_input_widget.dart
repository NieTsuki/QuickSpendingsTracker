import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
export 'name_input_model.dart';

class NameInputWidget extends StatefulWidget {
  const NameInputWidget({
    super.key,
    required this.text,
    required this.onChanged,
  });

  final String text;
  final void Function(String) onChanged;

  @override
  State<NameInputWidget> createState() => _NameInputWidgetState();
}

class _NameInputWidgetState extends State<NameInputWidget> {
  late final TextEditingController textController;
  late final FocusNode textFieldFocusNode;

  @override
  void initState() {
    super.initState();

    textController = TextEditingController(text: widget.text);

    textFieldFocusNode = FocusNode();
    textFieldFocusNode.addListener(() {
      final value = textController.value.text;
      widget.onChanged(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    textController.text = widget.text;

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
        cursorColor: FlutterFlowTheme.of(context).primaryText,
      ),
    );
  }
}
