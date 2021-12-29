import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum Unit {
  cubicMeter, // m³
  kWh
}

String unitToText(BuildContext context, Unit unit) {
    switch(unit) {
      case Unit.cubicMeter:
        return AppLocalizations.of(context)!.unitCubicMeter;
      case Unit.kWh:
        return AppLocalizations.of(context)!.unitKWh;
      default:
        throw UnimplementedError();
    }
}