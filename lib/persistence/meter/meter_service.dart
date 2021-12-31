import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:untitled/persistence/meter/meter_model.dart';
import 'package:untitled/persistence/persistence_service.dart';

class MeterService extends PersistenceService<Meter> {
  static MeterService? _singleton;
  static const String _tableName = 'meters';

  late final Database _database;

  MeterService._({required database}) {
    _database = database;
  }

  static Future<MeterService> initialize() async {
    if (_singleton == null) {
      final database = await PersistenceService.initialize();
      _singleton = MeterService._(database: database);
    }

    // Cannot be null at this point
    return _singleton as MeterService;
  }

  @override
  Future<void> create(model) async {
    _database.insert(_tableName, model.toMap());
  }

  @override
  Future<void> delete(model) async {
    _database.delete(_tableName, where: 'name = ?', whereArgs: [model.name]);
  }

  @override
  Future<List<Meter>> getAll() async {
    final List<Map<String, dynamic>> meterMaps =
        await _database.query(_tableName);
    return List.generate(
        meterMaps.length, (index) => Meter.fromMap(meterMaps[index]));
  }

  @override
  Future<void> update(model) async {
    _database.update(_tableName, model.toMap(),
        where: 'name = ?', whereArgs: [model.name]);
  }
}
