import '/flutter_flow/flutter_flow_util.dart';
import 'name_input_widget.dart' show NameInputWidget;
import 'package:flutter/material.dart';

class NameInputModel extends FlutterFlowModel<NameInputWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
