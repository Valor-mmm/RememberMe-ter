import 'package:untitled/common/units.dart';
import 'package:untitled/persistence/model.dart';

class Meter extends Model {
  final String name;
  final Unit unit;

  Meter({required this.name, required this.unit});

  @override
  Map<String, dynamic> toMap() {
    return {'name': name, 'unit': unit.name};
  }

  static Meter fromMap(Map<String, dynamic> map) {
    return Meter(name: map['name'], unit: Unit.values.byName(map['unit']));
  }

  @override
  String toString() {
    return 'Meter "$name" using unit: "${unit.name}"';
  }
}
