import 'package:transit_buddy/core/services/storage/storage_service.dart';
import 'alarm.dart';
import 'package:meta/meta.dart';

class AlarmRepository {
  static const String _tableName = 'alarms';
  final StorageService storage;
  AlarmRepository({@required this.storage});

  Future<List<Alarm>> all() async {
    List<Map<String, dynamic>> records =
        await storage.all(_tableName, 'arriveBy');
    return toList(records);
  }

  Future<int> add(
      {@required String name,
      @required String transitLocation,
      @required String arriveBy}) async {
    int id = await storage.create(_tableName, {
      'name': name,
      'transitLocation': transitLocation,
      'arriveBy': arriveBy
    });
    return id;
  }

  Future<bool> update(int id,
      {@required String name,
      @required String transitLocation,
      @required String arriveBy}) async {
    return storage.update(_tableName, id, {
      'name': name,
      'transitLocation': 'transitLocation',
      'arriveBy': arriveBy
    });
  }

  Future<bool> delete(int id) async {
    return storage.delete(_tableName, id);
  }

  Map<String, dynamic> toMap(Alarm model) {
    return {
      'name': model.name,
      'transitLocation': model.transitLocation,
      'arriveBy': model.arriveBy,
    };
  }

  static List<Alarm> toList(records) {
    return List.generate(records.length, (i) {
      return new Alarm(
          id: records[i]['id'],
          name: records[i]['name'],
          transitLocation: records[i]['transitLocation'],
          arriveBy: DateTime.parse(records[i]['arriveBy']));
    });
  }
}
