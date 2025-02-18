// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecordStruct extends BaseStruct {
  RecordStruct({
    DateTime? timestamp,
    String? name,
    double? amount,
    PaymentMethod? method,
  })  : _timestamp = timestamp,
        _name = name,
        _amount = amount,
        _method = method;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;

  bool hasTimestamp() => _timestamp != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;

  void incrementAmount(double amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  // "method" field.
  PaymentMethod? _method;
  PaymentMethod? get method => _method;
  set method(PaymentMethod? val) => _method = val;

  bool hasMethod() => _method != null;

  static RecordStruct fromMap(Map<String, dynamic> data) => RecordStruct(
        timestamp: data['timestamp'] as DateTime?,
        name: data['name'] as String?,
        amount: castToType<double>(data['amount']),
        method: data['method'] is PaymentMethod
            ? data['method']
            : deserializeEnum<PaymentMethod>(data['method']),
      );

  static RecordStruct? maybeFromMap(dynamic data) =>
      data is Map ? RecordStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'timestamp': _timestamp,
        'name': _name,
        'amount': _amount,
        'method': _method?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.double,
        ),
        'method': serializeParam(
          _method,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static RecordStruct fromSerializableMap(Map<String, dynamic> data) =>
      RecordStruct(
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.double,
          false,
        ),
        method: deserializeParam<PaymentMethod>(
          data['method'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'RecordStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RecordStruct &&
        timestamp == other.timestamp &&
        name == other.name &&
        amount == other.amount &&
        method == other.method;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([timestamp, name, amount, method]);
}

RecordStruct createRecordStruct({
  DateTime? timestamp,
  String? name,
  double? amount,
  PaymentMethod? method,
}) =>
    RecordStruct(
      timestamp: timestamp,
      name: name,
      amount: amount,
      method: method,
    );
