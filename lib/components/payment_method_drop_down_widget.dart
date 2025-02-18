import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'payment_method_drop_down_model.dart';
export 'payment_method_drop_down_model.dart';

class PaymentMethodDropDownWidget extends StatefulWidget {
  const PaymentMethodDropDownWidget({super.key});

  @override
  State<PaymentMethodDropDownWidget> createState() =>
      _PaymentMethodDropDownWidgetState();
}

class _PaymentMethodDropDownWidgetState
    extends State<PaymentMethodDropDownWidget> {
  late PaymentMethodDropDownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentMethodDropDownModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-1.0, 0.0),
      child: FlutterFlowDropDown<String>(
        controller: _model.dropDownValueController ??=
            FormFieldController<String>(
          _model.dropDownValue ??= PaymentMethod.Cash.name,
        ),
        options: PaymentMethod.values.map((e) => e.name).toList(),
        onChanged: (val) => safeSetState(() => _model.dropDownValue = val),
        width: 200.0,
        height: 40.0,
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Manrope',
              letterSpacing: 0.0,
            ),
        hintText: 'Select...',
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 24.0,
        ),
        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
        elevation: 2.0,
        borderColor: Colors.transparent,
        borderWidth: 0.0,
        borderRadius: 8.0,
        margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
        hidesUnderline: true,
        isOverButton: false,
        isSearchable: false,
        isMultiSelect: false,
      ),
    );
  }
}
