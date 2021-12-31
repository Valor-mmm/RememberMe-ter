import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

abstract class PersistenceService<Model> {
  static Future<Database> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = await openDatabase(join(await getDatabasesPath(), 'remember_meter.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE meters(name TEXT PRIMARY KEY, unit TEXT NOT NULL)');
    }, version: 1);
    return database;
  }

  Future<void> create(Model model);

  Future<List<Model>> getAll();

  Future<void> update(Model model);

  Future<void> delete(Model model);
}
