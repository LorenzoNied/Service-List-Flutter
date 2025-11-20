import 'package:injectable/injectable.dart';
import 'package:service_list_flutter/core/database/database.dart';
import 'package:sqflite/sqflite.dart';

@module
abstract class DatabaseModule {
  @lazySingleton
  AppDatabase get appDatabase => AppDatabase();

  @preResolve
  Future<Database> get database async => await appDatabase.database;
}