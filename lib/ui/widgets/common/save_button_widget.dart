import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final onPress;
  SaveButton({@required this.onPress});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.save),
        tooltip: 'Save new Alarm',
        onPressed: () {
          onPress();
        });
  }
}
