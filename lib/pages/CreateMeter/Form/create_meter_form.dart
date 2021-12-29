import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled/common/units.dart';
import 'package:untitled/pages/CreateMeter/Form/crate_meter_form_data.dart';

class CreateMeterForm extends StatefulWidget {
  const CreateMeterForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateMeterForm();
}

class _CreateMeterForm extends State<CreateMeterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CreateMeterFormData formData = CreateMeterFormData();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!
                          .createMeterFormNameInput),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!
                          .createMeterFormNameInputValidationEmpty;
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    formData.meterName = value;
                  },
                ),
                DropdownButtonFormField<Unit>(
                    decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!
                            .createMeterFormUnitInput),
                    validator: (Unit? value) {
                      if (value == null) {
                        return AppLocalizations.of(context)!
                            .createMeterFormUnitInputValidationEmpty;
                      }
                      return null;
                    },
                    items: Unit.values
                        .map((Unit unit) => DropdownMenuItem<Unit>(
                            child: Text(unitToText(context, unit)),
                            value: unit))
                        .toList(),
                    onChanged: (Unit? unit) {
                      formData.meterUnit = unit;
                    }),
                Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                            child: OutlinedButton(
                                onPressed: () => {Navigator.maybePop(context)},
                                child: Text(AppLocalizations.of(context)!
                                    .cancelAction))),
                        Flexible(
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    print(formData);
                                  }
                                },
                                child: Text(AppLocalizations.of(context)!
                                    .createAction)))
                      ],
                    ))
              ],
            )));
  }
}
