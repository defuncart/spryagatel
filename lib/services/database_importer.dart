import 'package:csv/csv.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spryagatel/configs/db_config.dart';
import 'package:spryagatel/models/verb.dart';

abstract class DatabaseImporter {
  static const csvDBPath = 'assets/db/verbs.csv';

  static Future<List<List<String>>> parse({
    required String csvString,
  }) async {
    final rows = await _csvRows(csvString, fieldDelimiter: '	');
    for (final row in rows) {
      if (row.length != 18) {
        print('${row.first} has ${row.length} elements!');
      }
    }
    rows.removeAt(0);

    print('CSV file imported...');

    return rows;
  }

  static Future<void> generate({
    required List<List<String>> rows,
  }) async {
    final isar = await Isar.open(
      schemas: [VerbSchema],
      name: DBConfig.dbName,
      directory: (await getApplicationDocumentsDirectory()).path,
    );
    await isar.writeTxn((isar) async {
      for (final row in rows) {
        final verb = Verb()
          ..infinitiv = row[_DBColumn.infinitiv]
          ..infinitivAccented = row[_DBColumn.infinitivAccent]
          // TODO deal with both case
          ..aspect = row[_DBColumn.aspect] == 'perfective' ? Aspect.perfective : Aspect.imperfective
          ..imperative = [
            row[_DBColumn.imperativeSingular],
            row[_DBColumn.imperativePlural],
          ]
          ..past = [
            row[_DBColumn.pastM],
            row[_DBColumn.pastF],
            row[_DBColumn.pastN],
            row[_DBColumn.pastP],
          ]
          ..presentFuture = [
            row[_DBColumn.ya],
            row[_DBColumn.ty],
            row[_DBColumn.onOnaOno],
            row[_DBColumn.my],
            row[_DBColumn.vy],
            row[_DBColumn.oni],
          ];

        isar.verbs.put(verb);
      }
    });
  }

  /// Parses a csv [string] into `List<List<String>>` using
  static Future<List<List<String>>> _csvRows(
    String string, {
    required String fieldDelimiter,
  }) async {
    const _csvConverter = CsvToListConverter();
    final lines = string.split('\n');
    final rows = <List<String>>[];
    for (final line in lines) {
      rows.add(
        _csvConverter.convert(line, fieldDelimiter: fieldDelimiter).first.map((element) => element.toString()).toList(),
      );
    }

    return rows;
  }
}

// ignore_for_file: unused_field

abstract class _DBColumn {
  static const infinitiv = 0;
  static const infinitivAccent = 1;
  static const en = 2;
  static const de = 3;
  static const aspect = 4;
  static const aspectPair = 5;
  static const imperativeSingular = 6;
  static const imperativePlural = 7;
  static const pastM = 8;
  static const pastF = 9;
  static const pastN = 10;
  static const pastP = 11;
  static const ya = 12;
  static const ty = 13;
  static const onOnaOno = 14;
  static const my = 15;
  static const vy = 16;
  static const oni = 17;
}
