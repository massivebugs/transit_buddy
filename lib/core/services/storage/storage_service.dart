import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// https://flutter.dev/docs/cookbook/persistence/sqlite

/// A Service class which serves as an abstraction layer to
/// store persistant data on local or remote storage.
class StorageService {
  /// Create singleton instance
  static final StorageService _instance = StorageService._initialize();
  StorageService._initialize();

  /// Always returns the existing [StorageService] instance
  factory StorageService() {
    return _instance;
  }

  /// The [Database] instance containing the connection.
  ///
  /// Get a reference to the database using [await _database]
  Database _db;

  /// Opens a [Database] connection
  ///
  /// References:
  /// https://github.com/tekartik/sqflite/blob/master/sqflite/doc/opening_asset_db.md
  Future<void> init() async {
    // Construct path for copying bundled .db into a useable location
    final String dbDir = await getDatabasesPath();
    final String dbPath = join(dbDir, "app.db");

    String initialTable = 'alarms';
    List<Map<String, dynamic>> initialData = [
      {
        'name': '会社に行くとき',
        'arriveBy': DateTime.now().toString(),
        'transitLocation': '秋葉原'
      },
      {
        'name': '友達と遊ぶ',
        'arriveBy': DateTime.now().toString(),
        'transitLocation': 'お茶の水'
      }
    ];

    // Remove any old database files
    // await deleteDatabase(dbPath);

    //  Check if a database already exists
    final bool exists = await databaseExists(dbPath);

    // Copy initial .db from asset to a useable location
    if (exists == false) {
      ByteData data = await rootBundle.load("lib/assets/storage/app.db");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(dbPath).writeAsBytes(bytes);
    }

    _db = await openDatabase(join(dbPath), onCreate: (db, version) {
      // Migrations can go here

      // Initial data insertion
      initialData.forEach((fields) {
        db.insert(initialTable, fields,
            conflictAlgorithm: ConflictAlgorithm.replace);
      });
    }, version: 1);
  }

  /// Find and retrieve a single record in [tableName] using [id]
  Future<Map<String, Object>> find(String tableName, int id) async {
    final List<Map<String, Object>> record = await _db.query(tableName,
        distinct: true, where: 'id = ?', whereArgs: [id], limit: 1);

    return record[0];
  }

  /// Returns all records from [tableName]
  Future<List<Map<String, Object>>> all(tableName) async {
    final List<Map<String, Object>> records =
        await _db.query(tableName, orderBy: 'id');
    return records;
  }

  /// Insert a record into table [tableName] with [fields]
  /// and returns the [id] of the newly inserted record
  Future<int> create(String tableName, Map<String, Object> fields) async {
    // Insert fields into table.
    // Replaces existing record if duplicates.
    int id = await _db.insert(tableName, fields,
        conflictAlgorithm: ConflictAlgorithm.replace);

    return id;
  }

  /// Update a single record in [tableName] with [id]
  /// and return true/false depending on whether success or fail
  Future<bool> update(String tableName, int id, Map fields) async {
    int count =
        await _db.update(tableName, fields, where: 'id = ?', whereArgs: [id]);
    return count == 1;
  }

  /// Delete a single record in [tableName] with [id]
  /// and return true/false depending on whether success or fail
  Future<bool> delete(String tableName, int id) async {
    int count = await _db.delete(tableName, where: 'id = ?', whereArgs: [id]);
    return count == 1;
  }
}
