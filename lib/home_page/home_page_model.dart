import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/amount_input_widget.dart';
import '/components/empty_records_message_widget.dart';
import '/components/name_input_widget.dart';
import '/components/payment_method_drop_down_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  List<RecordStruct> records = [];
  void addToRecords(RecordStruct item) => records.add(item);
  void removeFromRecords(RecordStruct item) => records.remove(item);
  void removeAtIndexFromRecords(int index) => records.removeAt(index);
  void insertAtIndexInRecords(int index, RecordStruct item) =>
      records.insert(index, item);
  void updateRecordsAtIndex(int index, Function(RecordStruct) updateFn) =>
      records[index] = updateFn(records[index]);

  bool isTableHidden = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<RecordStruct>();
  DateTime? datePicked;
  // Models for NameInput dynamic component.
  late FlutterFlowDynamicModels<NameInputModel> nameInputModels;
  // Models for AmountInput dynamic component.
  late FlutterFlowDynamicModels<AmountInputModel> amountInputModels;
  // Models for PaymentMethodDropDown dynamic component.
  late FlutterFlowDynamicModels<PaymentMethodDropDownModel>
      paymentMethodDropDownModels;

  @override
  void initState(BuildContext context) {
    nameInputModels = FlutterFlowDynamicModels(() => NameInputModel());
    amountInputModels = FlutterFlowDynamicModels(() => AmountInputModel());
    paymentMethodDropDownModels =
        FlutterFlowDynamicModels(() => PaymentMethodDropDownModel());
  }

  @override
  void dispose() {
    paginatedDataTableController.dispose();
    nameInputModels.dispose();
    amountInputModels.dispose();
    paymentMethodDropDownModels.dispose();
  }
}
