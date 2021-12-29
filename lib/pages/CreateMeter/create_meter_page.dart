import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled/common/app_bar.dart';
import 'package:untitled/pages/CreateMeter/Form/create_meter_form.dart';

class CreateMeterPage extends StatelessWidget {
  const CreateMeterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text(AppLocalizations.of(context)!.createMeterPageHeadline)),
      body: const CreateMeterForm()
    );
  }

}