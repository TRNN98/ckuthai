import 'dart:io';

import 'package:appbase/models/pinDb.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBPin {
  Database database1;

  Future<bool> initDB() async {
    try {
      final String dbName = 'PinDb.db';
      final String dbPath = await getDatabasesPath();
      final String path = join(dbPath, dbName);
      if (!await Directory(dirname(path)).exists()) {
        print("create pin");
        await Directory(dirname(path)).create(recursive: true);
      } else {
        print("no create pin");
      }
      database1 = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          print("Db Create");
          String sql = "CREATE TABLE $TABLE_PIN ("
              "$COLUMN_ID INTEGER PRIMARY KEY,"
              "$COLUMN_PINNUMBER TEXT"
              ")";
          await db.execute(sql);
        },
        onUpgrade: (Database db, int oldVersion, int newVersion) {
          print("Database oldVersion: $oldVersion, newVersion $newVersion");
        },
        onOpen: (Database db) async {
          print("Database version: ${await db.getVersion()}");
        },
      );
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future close() async => database1.close();

  Future<List<PinDb>> getPins() async {
    List<Map> maps = await database1.query(
      TABLE_PIN,
      columns: [COLUMN_ID, COLUMN_PINNUMBER],
    );
//    List<Map> maps = await database.rawQuery("SELECT * FROM $TABLE_PRODUCT");
    if (maps.length > 0) {
      return maps.map((p) => PinDb.fromMap(p)).toList();
    }
    return [];
  }

  Future<PinDb> insertPins(PinDb pins) async {
    pins.id = await database1.insert(TABLE_PIN, pins.toMap());

    return pins;
  }

  Future<int> updatePins(PinDb pins) async {
    return await database1.update(
      TABLE_PIN,
      pins.toMap(),
      where: "$COLUMN_ID = ?",
      whereArgs: [pins.id],
    );
  }

  Future<void> deleteAll() async {
    String sql = "Delete from $TABLE_PIN";
    try {
      return await database1.rawDelete(sql);
    } catch (err) {
      return;
    }
  }
}
