import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class AlarmFormWidget extends StatefulWidget {
  final formKey;

  final nameController;
  final transitLocationController;
  final arriveByController;

  // Pass this if initial values should be set
  final selectedAlarm;

  AlarmFormWidget(
      {@required this.formKey,
      @required this.nameController,
      @required this.transitLocationController,
      @required this.arriveByController,
      this.selectedAlarm});

  @override
  _AlarmFormWidgetState createState() => _AlarmFormWidgetState();
}

class _AlarmFormWidgetState extends State<AlarmFormWidget> {
  final formatter = DateFormat("yyyy-MM-dd HH:mm");

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    widget.nameController.dispose();
    widget.transitLocationController.dispose();
    widget.arriveByController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Set default values of the form if an alarm is passed down as a parameter
    if (widget.selectedAlarm != null) {
      widget.nameController.text = widget.selectedAlarm.name;
      widget.transitLocationController.text =
          widget.selectedAlarm.transitLocation;
      // This sets the controller value,
      // not the internal value used in the form input
      widget.arriveByController.text =
          formatter.format(widget.selectedAlarm.arriveBy);
    }
    return Form(
        key: widget.formKey,
        child: Container(
            child: Column(
          children: [
            TextFormField(
              controller: widget.nameController,
              decoration: InputDecoration(
                  icon: Icon(Icons.directions_run_sharp),
                  hintText: 'Name of Alarm'),
              validator: (String value) {
                if (value == null || value.isEmpty) {
                  return 'You must enter the name of your alarm.';
                }
                return null;
              },
            ),
            // TextFormField(
            //   controller: widget.transitLocationController,
            //   decoration: InputDecoration(
            //       icon: Icon(Icons.location_on_sharp),
            //       hintText: 'Name of Departure'),
            //   validator: (String value) {
            //     if (value == null || value.isEmpty) {
            //       return 'You must enter the name of a destination.';
            //     }
            //     return null;
            //   },
            // ),
            TextFormField(
              controller: widget.transitLocationController,
              decoration: InputDecoration(
                  icon: Icon(Icons.location_on_sharp),
                  hintText: 'Name of Destination'),
              validator: (String value) {
                if (value == null || value.isEmpty) {
                  return 'You must enter the name of a destination.';
                }
                return null;
              },
            ),
            DateTimeField(
                controller: widget.arriveByController,
                format: formatter,
                // This sets the internal value of the input field
                initialValue: widget.selectedAlarm?.arriveBy,
                decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today_sharp),
                    hintText: 'Pick an Arrival time'),
                validator: (DateTime value) {
                  if (value == null) {
                    return 'You must set an arrival time';
                  }
                  return null;
                },
                onShowPicker: (context, currentValue) async {
                  final date = await showDatePicker(
                      context: context,
                      initialDate: currentValue ?? DateTime.now(),
                      firstDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                  if (date != null) {
                    final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                            currentValue ?? DateTime.now()));
                    return DateTimeField.combine(date, time);
                  } else {
                    return currentValue;
                  }
                }),
          ],
        )));
  }
}
