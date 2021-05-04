import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transit_buddy/core/services/storage/storage_service.dart';
import 'package:transit_buddy/models/alarm_repository.dart';
import 'package:transit_buddy/ui/view_models/alarm_view_model.dart';
import 'package:transit_buddy/ui/views/alarms/alarm_index_view.dart';
import 'package:global_configuration/global_configuration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Loads all configurations, services and initial data
  // - Load configurations
  await GlobalConfiguration().loadFromPath('lib/assets/configs/app.json');

  // - Initialize storage service
  await StorageService().init();

  // - Create view models, inject dependencies
  final alarmViewModel =
      AlarmViewModel(repository: AlarmRepository(storage: StorageService()));
  await alarmViewModel.loadData();

  runApp(ChangeNotifierProvider(
    create: (context) => alarmViewModel,
    child: TransitBuddy(),
  ));
}

// Main Favourite Things App
class TransitBuddy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.red[400], accentColor: Colors.redAccent),
        title: GlobalConfiguration().getValue('appTitle'),
        home: AlarmIndexView());
  }
}
