import 'package:flutter/material.dart';
import 'package:untitled/persistence/meter/meter_model.dart';
import 'package:untitled/persistence/meter/meter_service.dart';

class MeterList extends StatefulWidget {
  const MeterList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MeterList();
  }
}

class _MeterList extends State<MeterList> {
  late final Future<MeterService> meterService;
  List<Meter>? meters;

  _MeterList() {
    meterService = MeterService.initialize();
  }

  @override
  void initState() {
    super.initState();
    _loadMeters();
  }

  Future<void> _loadMeters() async {
    final allMeters = await (await meterService).getAll();
    setState(() {
      meters = allMeters;
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    if (meters == null || meters?.isEmpty == true) {
      return const Center(child: CircularProgressIndicator());
    }

    return RefreshIndicator(onRefresh: _loadMeters,child: ListView.builder(itemCount: meters?.length,itemBuilder: (BuildContext context, int index) {
      return Padding(padding: const EdgeInsets.all(8),
      child: Card(child: Text(meters?[index].name as String)));
    }));
  }

}

