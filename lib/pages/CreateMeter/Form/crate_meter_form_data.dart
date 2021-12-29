import 'package:untitled/common/units.dart';

class CreateMeterFormData {
  String? meterName;
  Unit? meterUnit;

  CreateMeterFormData({this.meterName, this.meterUnit});

  @override
  String toString() => "CreateMeterFormData: $meterName using $meterUnit";
}
