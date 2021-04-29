import 'package:flutter/material.dart';
import 'package:trainbuddy/ui/view_models/alarm_view_model.dart';
import 'package:trainbuddy/ui/widgets/alarms/alarm_form_widget.dart';

class AlarmCreateView extends StatefulWidget {
  @override
  _AlarmCreateViewState createState() => _AlarmCreateViewState();
}

class _AlarmCreateViewState extends State<AlarmCreateView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set a New Alarm'),
      ),
      body: ListView(
        children: [
          AlarmFormWidget(onSubmit: (name, transitLocation, arriveBy) {
            AlarmViewModel.of(context).add(
                name: name,
                transitLocation: transitLocation,
                arriveBy: arriveBy);
            Navigator.pop(context);
          })
        ],
      ),
    );
  }
}
