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
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            _model.isTableHidden = true;
            safeSetState(() {});
            _model.addToRecords(RecordStruct(
              timestamp: getCurrentTimestamp,
              name: '',
              amount: 0.0,
              method: PaymentMethod.Cash,
            ));
            await Future.delayed(const Duration(milliseconds: 10));
            _model.isTableHidden = false;
            safeSetState(() {});
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.add_rounded,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (!_model.isTableHidden)
                Expanded(
                  child: Builder(
                    builder: (context) {
                      final recs = _model.records.toList();

                      if (recs.isEmpty) {
                        return Center(
                          child: EmptyRecordsMessageWidget(),
                        );
                      }

                      return FlutterFlowDataTable<RecordStruct>(
                        controller: _model.paginatedDataTableController,
                        data: recs,
                        columnsBuilder: (onSortChanged) => [
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'Time',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            fixedWidth: 120.0,
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'Name',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            fixedWidth: 200.0,
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'Amount',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            fixedWidth: 110.0,
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'Method',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            fixedWidth: 110.0,
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Text(
                                  'Actions',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Manrope',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            fixedWidth: 70.0,
                          ),
                        ],
                        dataRowBuilder:
                            (recsItem, recsIndex, selected, onSelectChanged) =>
                                DataRow(
                          color: MaterialStateProperty.all(
                            recsIndex % 2 == 0
                                ? FlutterFlowTheme.of(context).primaryBackground
                                : FlutterFlowTheme.of(context)
                                    .primaryBackground,
                          ),
                          cells: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final _datePickedDate = await showDatePicker(
                                  context: context,
                                  barrierDismissible: false,
                                  initialDate:
                                      (recsItem.timestamp ?? DateTime.now()),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime.now(),
                                  builder: (context, child) {
                                    return wrapInMaterialDatePickerTheme(
                                      context,
                                      child!,
                                      headerBackgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      headerForegroundColor:
                                          FlutterFlowTheme.of(context).info,
                                      headerTextStyle:
                                          FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                fontFamily: 'Urbanist',
                                                fontSize: 32.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                      pickerBackgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      pickerForegroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      selectedDateTimeBackgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      selectedDateTimeForegroundColor:
                                          FlutterFlowTheme.of(context).info,
                                      actionButtonForegroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      iconSize: 24.0,
                                    );
                                  },
                                );

                                TimeOfDay? _datePickedTime;
                                if (_datePickedDate != null) {
                                  _datePickedTime = await showTimePicker(
                                    context: context,
                                    barrierDismissible: false,
                                    initialTime: TimeOfDay.fromDateTime(
                                        (recsItem.timestamp ?? DateTime.now())),
                                    builder: (context, child) {
                                      return wrapInMaterialTimePickerTheme(
                                        context,
                                        child!,
                                        headerBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        headerForegroundColor:
                                            FlutterFlowTheme.of(context).info,
                                        headerTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .headlineLarge
                                                .override(
                                                  fontFamily: 'Urbanist',
                                                  fontSize: 32.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                        pickerBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        pickerForegroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        selectedDateTimeBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        selectedDateTimeForegroundColor:
                                            FlutterFlowTheme.of(context).info,
                                        actionButtonForegroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        iconSize: 24.0,
                                      );
                                    },
                                  );
                                }

                                if (_datePickedDate != null &&
                                    _datePickedTime != null) {
                                  safeSetState(() {
                                    _model.datePicked = DateTime(
                                      _datePickedDate.year,
                                      _datePickedDate.month,
                                      _datePickedDate.day,
                                      _datePickedTime!.hour,
                                      _datePickedTime.minute,
                                    );
                                  });
                                } else if (_model.datePicked != null) {
                                  safeSetState(() {
                                    _model.datePicked = recsItem.timestamp;
                                  });
                                }
                                _model.updateRecordsAtIndex(
                                  recsIndex,
                                  (e) => e..timestamp = _model.datePicked,
                                );
                                safeSetState(() {});
                              },
                              child: Text(
                                valueOrDefault<String>(
                                  dateTimeFormat(
                                      "MMM d h:mm a", recsItem.timestamp),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            wrapWithModel(
                              model: _model.nameInputModels.getModel(
                                recsIndex.toString(),
                                recsIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: NameInputWidget(
                                key: Key(
                                  'Keyq3k_${recsIndex.toString()}',
                                ),
                                text: recsItem.name,
                                onChanged: (String value) {
                                  recsItem.name = value;
                                  safeSetState(() {});
                                },
                              ),
                            ),
                            wrapWithModel(
                              model: _model.amountInputModels.getModel(
                                recsIndex.toString(),
                                recsIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: AmountInputWidget(
                                key: Key(
                                  'Keyygo_${recsIndex.toString()}',
                                ),
                                value: recsItem.amount,
                                onChanged: (double value) {
                                  recsItem.amount = value;
                                  safeSetState(() {});
                                },
                              ),
                            ),
                            wrapWithModel(
                              model:
                                  _model.paymentMethodDropDownModels.getModel(
                                recsIndex.toString(),
                                recsIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: PaymentMethodDropDownWidget(
                                key: Key(
                                  'Keyycg_${recsIndex.toString()}',
                                ),
                                option: recsItem.method ?? PaymentMethod.Cash,
                                onChanged: (PaymentMethod value) {
                                  recsItem.method = value;
                                  safeSetState(() {});
                                },
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.delete,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  _model.removeAtIndexFromRecords(
                                      recsIndex);
                                  safeSetState(() {});
                                },
                              ),
                            ),
                          ].map((c) => DataCell(c)).toList(),
                        ),
                        emptyBuilder: () => Center(
                          child: EmptyRecordsMessageWidget(),
                        ),
                        paginated: false,
                        selectable: false,
                        headingRowHeight: 56.0,
                        dataRowHeight: 48.0,
                        columnSpacing: 20.0,
                        headingRowColor: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(8.0),
                        addHorizontalDivider: false,
                        addTopAndBottomDivider: false,
                        hideDefaultHorizontalDivider: true,
                        addVerticalDivider: false,
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
