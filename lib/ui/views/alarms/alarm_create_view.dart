import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transit_buddy/ui/view_models/alarm_view_model.dart';
import 'package:transit_buddy/ui/widgets/alarms/alarm_form_widget.dart';
import 'package:transit_buddy/ui/widgets/common/save_button_widget.dart';

class AlarmCreateView extends StatefulWidget {
  @override
  _AlarmCreateViewState createState() => _AlarmCreateViewState();
}

class _AlarmCreateViewState extends State<AlarmCreateView> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final transitLocationController = TextEditingController();
  final arriveByController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AlarmViewModel>(
        builder: (context, alarmViewModel, child) => Scaffold(
              appBar: AppBar(
                title: Text('Set a New Alarm'),
                actions: [
                  SaveButton(onPress: () {
                    if (formKey.currentState.validate()) {
                      alarmViewModel.add(
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
                child: AlarmFormWidget(
                  formKey: formKey,
                  nameController: nameController,
                  transitLocationController: transitLocationController,
                  arriveByController: arriveByController,
                ),
              ),
            ));
  }
}
