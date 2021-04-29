import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainbuddy/ui/view_models/alarm_view_model.dart';
import 'package:trainbuddy/ui/views/alarms/alarm_index_view.dart';
import 'core/constants/app_constants.dart';

void main() async {
  runApp(ChangeNotifierProvider(
    create: (context) => AlarmViewModel(),
    child: TrainBuddy(),
  ));
}

// Main Favourite Things App
class TrainBuddy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: AppConstants.APP_TITLE, home: AlarmIndexView());
  }
}
