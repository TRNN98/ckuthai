import 'dart:io';

import 'package:appbase/models/tfDb.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBTf {
  Database database;

  Future<bool> initDB() async {
    try {
      final String dbName = 'TFDb.db';
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
          String sql = "CREATE TABLE $TABLE_TF ("
              "$COLUMN_ID INTEGER PRIMARY KEY,"
              "$COLUMN_TF TEXT"
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

  Future<List<TFDb>> getTf() async {
    List<Map> maps = await database.query(
      TABLE_TF,
      columns: [COLUMN_ID, COLUMN_TF],
    );

    if (maps.length > 0) {
      return maps.map((p) => TFDb.fromMap(p)).toList();
    }
    return [];
  }

  Future<TFDb> insertTf(TFDb tf) async {
    tf.id = await database.insert(TABLE_TF, tf.toMap());
    // product.id = await database.rawInsert("INSERT Into ....");
    return tf;
  }

  Future<int> updateTf(TFDb tf) async {
    return await database.update(
      TABLE_TF,
      tf.toMap(),
      where: "$COLUMN_ID = ?",
      whereArgs: [tf.id],
    );
  }

  Future<void> deleteAll() async {
    String sql = "Delete from $TABLE_TF";
    // return await database.rawDelete(sql);
    try {
      return await database.rawDelete(sql);
    } catch (err) {
      return;
    }
  }
}
