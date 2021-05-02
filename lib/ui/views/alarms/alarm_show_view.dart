import 'package:flutter/material.dart';
import 'package:transit_buddy/models/alarm.dart';

class AlarmShowView extends StatelessWidget {
  final Alarm alarm;

  AlarmShowView({@required this.alarm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(alarm.name),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Text(alarm.name),
      ),
    );
  }
}
