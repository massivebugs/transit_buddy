import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainbuddy/ui/view_models/alarm_view_model.dart';
import 'package:trainbuddy/ui/views/alarms/alarm_create_view.dart';
import 'package:trainbuddy/ui/widgets/alarms/alarm_list_widget.dart';

class AlarmIndexView extends StatefulWidget {
  @override
  _AlarmIndexViewState createState() => _AlarmIndexViewState();
}

class _AlarmIndexViewState extends State<AlarmIndexView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alarms list')),
      body: Container(
          child: Consumer<AlarmViewModel>(
              builder: (context, alarmViewModel, child) => AlarmListWidget(
                  alarms: alarmViewModel.alarms,
                  onRemove: alarmViewModel.delete))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return AlarmCreateView();
          }));
        },
      ),
    );
  }
}
