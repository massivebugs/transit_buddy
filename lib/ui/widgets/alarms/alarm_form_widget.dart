import 'package:flutter/material.dart';
import 'package:transit_buddy/ui/widgets/common/save_button_widget.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class AlarmFormWidget extends StatefulWidget {
  final onSubmit;
  AlarmFormWidget({@required this.onSubmit});

  @override
  _AlarmFormWidgetState createState() => _AlarmFormWidgetState();
}

class _AlarmFormWidgetState extends State<AlarmFormWidget> {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final transitLocationController = TextEditingController();
  final arriveByController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    transitLocationController.dispose();
    arriveByController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: 'Name of Alarm'),
                  validator: (String value) {
                    if (value == null || value.isEmpty) {
                      return 'You must enter the name of your alarm.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: transitLocationController,
                  decoration: InputDecoration(hintText: 'Name of Destination'),
                  validator: (String value) {
                    if (value == null || value.isEmpty) {
                      return 'You must enter the name of a destination.';
                    }
                    return null;
                  },
                ),
                DateTimeField(
                    controller: arriveByController,
                    format: format,
                    decoration:
                        InputDecoration(hintText: 'Pick an Arrival time'),
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
                SaveButton(onSave: submitHandler)
              ],
            )));
  }

  void submitHandler() {
    if (_formKey.currentState.validate()) {
      // Process data
      widget.onSubmit(nameController.text, transitLocationController.text,
          arriveByController.text);
    }
  }
}
