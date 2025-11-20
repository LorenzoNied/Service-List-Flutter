import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    return await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'database.db');

    _db = await openDatabase(
      path,
      version: 1,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );

    return _db!;
  }

  Future<void> _onCreate(Database db, int version) async {
    await _runMigrations(db);
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await _runMigrations(db);
  }

  Future<void> _runMigrations(Database db) async {
    final migrationFiles = [
      'lib/core/database/migrations/000001_initial_state_database.up.sql',
    ];

    for (final file in migrationFiles) {
      final sql = await rootBundle.loadString(file);
      await db.execute(sql);
    }
  }
}
