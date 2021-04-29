// import 'dart:async';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:trainbuddy/core/constants/app_constants.dart';
// import 'package:trainbuddy/models/alarm.dart';

// https://flutter.dev/docs/cookbook/persistence/sqlite

class SqfliteService {
  // // The database connection
  // Future<Database> _database;
  // static final SqfliteService _instance = SqfliteService._initialize();

  // SqfliteService._initialize() {
  //   // Initialize database connection on singleton instance creation
  //   _database = _initDB();
  // }

  // // Make sure to only return the existing instance once initialized
  // factory SqfliteService() {
  //   return _instance;
  // }

  // // Opens a database connection
  // Future<Database> _initDB() async {
  //   return openDatabase(
  //       join(await getDatabasesPath(), '${AppConstants.DB_NAME}.db'),
  //       onCreate: (db, version) {
  //     // Migrations can go here
  //     // db.execute('CREATE TABLE alarms(id INTEGER PRIMARY KEY, name TEXT)');
  //   }, version: 1);
  // }

  // Future<void> insert(String tableName, Alarm model) async {
  //   final Database db = await _database;
  //   await db.insert(tableName, model.toMap(),
  //       conflictAlgorithm: ConflictAlgorithm.replace);
  // }

  // Future<List<Alarm>> all(String tableName) async {
  //   final Database db = await _database;
  //   final List<Map<String, dynamic>> data = await db.query(tableName);

  //   return List.generate(data.length, (row) {
  //     return Alarm(name: data[row]['name']);
  //   });
  // }
}
