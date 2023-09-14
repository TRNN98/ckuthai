import 'dart:io';

import 'package:appbase/models/lgDb.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBLg {
  Database database;

  Future<bool> initDB
  () async {
    try {
      final String dbName = 'LGDb.db';
      final String dbPath = await getDatabasesPath();
      final String path = join(dbPath, dbName);

      if (!await Directory(dirname(path)).exists()) {
        print("create");
        await Directory(dirname(path)).create(recursive: true);
      } else {
        print("no create");
      }
      database = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          print("Db Create");
          String sql = "CREATE TABLE $TABLE_LG ("
              "$COLUMN_ID INTEGER PRIMARY KEY,"
              "$COLUMN_LG TEXT"
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

  Future close() async => database.close();

  Future<List<LGDb>> getLg() async {
    List<Map> maps = await database.query(
      TABLE_LG,
      columns: [COLUMN_ID, COLUMN_LG],
    );

    if (maps.length > 0) {
      return maps.map((p) => LGDb.fromMap(p)).toList();
    }
    return [];
  }

  Future<LGDb> insertLg(LGDb lg) async {
    lg.id = await database.insert(TABLE_LG, lg.toMap());
    // product.id = await database.rawInsert("INSERT Into ....");
    return lg;
  }

  Future<int> updateLg(LGDb lg) async {
    return await database.update(
      TABLE_LG,
      lg.toMap(),
      where: "$COLUMN_ID = ?",
      whereArgs: [lg.id],
    ); 
  }

  Future<void> deleteAll() async {
    String sql = "Delete from $TABLE_LG";
    // return await database.rawDelete(sql);
    try {
      return await database.rawDelete(sql);
    } catch (err) {
      return;
    }
  }
}
