import 'package:flutter/material.dart';
// import 'package:trainbuddy/core/models/alarm.dart';
// import 'package:trainbuddy/core/utilities/services/persistence_service/persistence_service.dart';
import 'package:trainbuddy/ui/view_models/alarm_view_model.dart';
import 'package:trainbuddy/ui/views/alarms/alarm_index_view.dart';
import 'core/constants/app_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final PersistenceService db = PersistenceService();
  // await db.createTable('alarms');
  // await db.insert('alarms', Alarm(name: 'First model'));
  // print(await db.all('alarms'));

  runApp(TrainBuddy());
}

// Main Favourite Things App
class TrainBuddy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppConstants.APP_TITLE,
        home: AlarmViewModel(child: AlarmIndexView()));
  }
}
