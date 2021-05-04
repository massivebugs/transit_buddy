import 'package:flutter/material.dart';
import 'package:transit_buddy/models/alarm.dart';
import 'package:provider/provider.dart';
import 'package:transit_buddy/ui/view_models/alarm_view_model.dart';
import 'package:transit_buddy/ui/widgets/alarms/alarm_form_widget.dart';
import 'package:transit_buddy/ui/widgets/common/save_button_widget.dart';
import 'package:transit_buddy/ui/widgets/transit/transit_routes_widget.dart';

class AlarmShowView extends StatelessWidget {
  final Alarm alarm;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final transitLocationController = TextEditingController();
  final arriveByController = TextEditingController();

  AlarmShowView({@required this.alarm});

  @override
  Widget build(BuildContext context) {
    return Consumer<AlarmViewModel>(
        builder: (context, alarmViewModel, child) => Scaffold(
            appBar: AppBar(
              title: Text(alarm.name),
              actions: [
                SaveButton(onPress: () {
                  if (formKey.currentState.validate()) {
                    alarmViewModel.update(alarm.id,
                        name: nameController.text,
                        transitLocation: transitLocationController.text,
                        arriveBy: arriveByController.text);
                    Navigator.pop(context);
                  }
                })
              ],
            ),
            body: Container(
                margin: EdgeInsets.only(top: 8.0),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(children: [
                  AlarmFormWidget(
                    formKey: formKey,
                    nameController: nameController,
                    transitLocationController: transitLocationController,
                    arriveByController: arriveByController,
                    selectedAlarm: alarm,
                  ),
                  TransitRoutesWidget(alarmViewModel.getTransitInformation()),
                ]))));
  }
}
