import 'dart:io';

import 'package:appbase/models/userDb.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBUser {
  Database database;

  Future<bool> initDB() async {
    try {
      final String dbName = 'UserDb.db';
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
          String sql = "CREATE TABLE $TABLE_USERNAME ("
              "$COLUMN_ID INTEGER PRIMARY KEY,"
              "$COLUMN_USER TEXT,"
              "$COLUMN_PASSWORD TEXT"
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

  Future<List<UserDb>> getUsers() async {
    List<Map> maps = await database.query(
      TABLE_USERNAME,
      columns: [COLUMN_ID, COLUMN_USER, COLUMN_PASSWORD],
    );

//    List<Map> maps = await database.rawQuery("SELECT * FROM $TABLE_PRODUCT");

    if (maps.length > 0) {
      return maps.map((p) => UserDb.fromMap(p)).toList();
    }
    return [];
  }

  Future<UserDb> insertUsers(UserDb users) async {
    users.id = await database.insert(TABLE_USERNAME, users.toMap());
    // product.id = await database.rawInsert("INSERT Into ....");
    return users;
  }

  Future<int> updateUsers(UserDb users) async {
    return await database.update(
      TABLE_USERNAME,
      users.toMap(),
      where: "$COLUMN_ID = ?",
      whereArgs: [users.id],
    );
  }

  Future<void> deleteAll() async {
    String sql = "Delete from $TABLE_USERNAME";
    // return await database.rawDelete(sql);
    try {
      return await database.rawDelete(sql);
    } catch (err) {
      return;
    }
  }
}
