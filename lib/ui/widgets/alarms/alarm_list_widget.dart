import 'package:flutter/material.dart';
import 'package:transit_buddy/ui/views/alarms/alarm_show_view.dart';
import 'package:transit_buddy/models/alarm.dart';
import 'package:intl/intl.dart';

class AlarmListWidget extends StatelessWidget {
  final List<Alarm> alarms;
  final ValueChanged<int> onRemove;
  AlarmListWidget({@required this.alarms, @required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: alarms.length,
      itemBuilder: (context, index) {
        final item = alarms[index];
        return Card(
            child: Dismissible(
                key: Key(item.name),
                onDismissed: (direction) {
                  onRemove(item.id);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('${item.name} has been removed!'),
                  ));
                },
                background: Container(
                  color: Colors.red[400],
                  child: Icon(
                    Icons.delete_outline_sharp,
                    color: Colors.grey[100],
                  ),
                ),
                child: InkWell(
                    child: ListTile(
                  title: Text(
                    alarms[index].name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat('yyyy/MM/dd hh:mm')
                        .format(alarms[index].arriveBy),
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.grey[750]),
                  ),
                  // trailing: Icon(Icons.more_vert),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return AlarmShowView(alarm: alarms[index]);
                    }));
                  },
                ))));
      },
    );
  }
}
