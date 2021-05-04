import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transit_buddy/core/helpers/datetime_helpers.dart'
    as dateTimeHelpers;
import 'package:transit_buddy/core/services/transit_information/src/concrete/fake_transit_data_strategy.dart';
import 'package:transit_buddy/core/services/transit_information/transit_information_service.dart';
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

  List<Map<String, dynamic>> getTransitInformation() {
    final data = TransitInformationService(
            transitDataStrategy: FakeTransitDataStrategy())
        .getInformation('', '');

    data.forEach((route) {
      final transitType = route['transitType'];
      switch (transitType) {
        case 'walk':
          {
            route['transitType'] = Icon(Icons.directions_walk_sharp);
          }
          break;
        case 'train':
          {
            route['transitType'] = Icon(Icons.train_sharp);
          }
          break;
        case 'bus':
          {
            route['transitType'] = Icon(Icons.directions_bus_sharp);
          }
          break;
        default:
          {
            route['transitType'] = Icon(Icons.help_center_sharp);
          }
      }
      route['depart'] = dateTimeHelpers.format(DateTime.parse(route['depart']));
      route['arrive'] = dateTimeHelpers.format(DateTime.parse(route['depart']));
    });
    return data;
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

  void update(id,
      {@required name, @required transitLocation, @required arriveBy}) async {
    final bool result = await repository.update(id,
        name: name, transitLocation: transitLocation, arriveBy: arriveBy);
    if (result) {
      await loadData();
      notifyListeners();
    }
  }
}
