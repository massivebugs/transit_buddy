import 'package:flutter/cupertino.dart';
import 'package:transit_buddy/models/alarm.dart';
import 'package:transit_buddy/models/alarm_repository.dart';

class AlarmViewModel extends ChangeNotifier {
  final AlarmRepository repository;
  AlarmViewModel({@required this.repository});

  List<Alarm> _alarms = [];
  List<Alarm> get alarms => _alarms;

  Future<void> loadData() async {
    _alarms = await repository.all();
  }

  void add(
      {@required name, @required transitLocation, @required arriveBy}) async {
    final int result = await repository.add(
        name: name, transitLocation: transitLocation, arriveBy: arriveBy);
    if (result != null) {
      await loadData();
      notifyListeners();
    }
  }

  void delete(id) async {
    final bool result = await repository.delete(id);
    if (result) {
      await loadData();
      notifyListeners();
    }
  }
}
