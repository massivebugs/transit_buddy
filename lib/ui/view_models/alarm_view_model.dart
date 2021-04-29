import 'package:flutter/cupertino.dart';
import 'package:trainbuddy/models/alarm.dart';

class AlarmViewModel extends InheritedWidget {
  AlarmViewModel({@required Widget child}) : super(child: child);

  final List<Alarm> alarms = Alarm.all();

  void add({@required name, @required transitLocation, @required arriveBy}) {
    Alarm.add(name: name, transitLocation: transitLocation, arriveBy: arriveBy);
  }

  void remove(int index) {
    alarms.remove(index);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static AlarmViewModel of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AlarmViewModel>();
}
