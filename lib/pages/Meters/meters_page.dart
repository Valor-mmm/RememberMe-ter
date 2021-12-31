import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled/common/app_bar.dart';
import 'package:untitled/pages/CreateMeter/create_meter_page.dart';
import 'package:untitled/pages/Meters/MeterList.dart';

class MetersPage extends StatelessWidget {
  const MetersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(AppLocalizations.of(context)!.meterPageHeadline),
      ),
      body: const MeterList(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CreateMeterPage())),
        label: Text(AppLocalizations.of(context)!.meterPageAddMeter),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
