import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transit_buddy/core/services/transit_information/src/concrete/yahoo_transit_get_transit_data_strategy.dart';
import 'package:transit_buddy/core/services/transit_information/transit_information_service.dart';
import 'package:transit_buddy/models/alarm.dart';
import 'package:transit_buddy/models/alarm_repository.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

class AlarmViewModel extends ChangeNotifier {
  final AlarmRepository repository;
  AlarmViewModel({@required this.repository});

  List<Alarm> _alarms = [];
  List<Alarm> get alarms => _alarms;

  Future<void> loadData() async {
    _alarms = await repository.all();
  }

  Future<List<Map<String, dynamic>>> getTransitInformation(String to) async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await location.getLocation();
    List<geocoding.Placemark> placemarks =
        await geocoding.placemarkFromCoordinates(
            _locationData.latitude, _locationData.longitude,
            localeIdentifier: 'ja_JP');
    print(placemarks);

    final data = await TransitInformationService(
            transitDataStrategy: YahooTransitDataStrategy())
        .getInformation('吉川駅', to);

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
