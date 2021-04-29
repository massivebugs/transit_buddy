import 'package:flutter/cupertino.dart';
import 'package:trainbuddy/models/alarm.dart';

class AlarmViewModel extends ChangeNotifier {
  AlarmViewModel();

  final List<Alarm> _alarms = Alarm.all();

  List<Alarm> get alarms => _alarms;

  void add({@required name, @required transitLocation, @required arriveBy}) {
    // Alarm.add(name: name, transitLocation: transitLocation, arriveBy: arriveBy);
    _alarms.add(new Alarm(
        name: name, transitLocation: transitLocation, arriveBy: arriveBy));
    notifyListeners();
  }

  void delete(int index) {
    _alarms.removeAt(index);
    notifyListeners();
  }
}
