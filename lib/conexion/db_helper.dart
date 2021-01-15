import 'dart:io';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final dbName = 'bdd_learning.db';

Future<Database> copyDB() async {
  var dbPath = await getDatabasesPath();
  var path = join(dbPath, dbName);
  try {
    await Directory(dirname(path)).create(recursive: true);
  } catch (_) {}
  ByteData data = await rootBundle.load(join("assets/database", dbName));
  List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  await File(path).writeAsBytes(bytes, flush: true);
  return await openDatabase(path, readOnly: true);
}