import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final onSave;
  SaveButton({@required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: TextButton(
        child: Text('Save'),
        onPressed: () {
          onSave();
        },
      ),
    );
  }
}
