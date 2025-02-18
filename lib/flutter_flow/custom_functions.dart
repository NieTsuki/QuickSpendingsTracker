import 'dart:io';
import 'dart:convert';
import '/backend/schema/structs/index.dart';
import 'package:path_provider/path_provider.dart';

Future<List<RecordStruct>> loadRecords() async {
  final directory = (await getApplicationDocumentsDirectory()).path;
  final file = File("$directory/records.json");

  if (!await file.exists()) return [];

  final fileContent = await file.readAsString();
  final List<dynamic> data = json.decode(fileContent);

  return data.map((item) => RecordStruct.fromString(item)).toList();
}

void saveRecords(List<RecordStruct> records) async {
  final directory = (await getApplicationDocumentsDirectory()).path;
  final file = File("$directory/records.json");
  final data = json.encode(
    records.map((record) => record.serialize()).toList()
  );
  await file.writeAsString(data);
}
