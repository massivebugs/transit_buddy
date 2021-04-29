import 'package:meta/meta.dart';
import 'package:trainbuddy/core/models/base_model.dart';

class Alarm extends BaseModel {
  final String name;
  final String transitLocation;
  final DateTime arriveBy;

  Alarm(
      {@required this.name,
      @required this.transitLocation,
      @required this.arriveBy})
      : super('alarms');

  static bool add(
      {@required name, @required transitLocation, @required arriveBy}) {
    return true;
  }

  static List<Alarm> all() {
    return [
      new Alarm(
          name: '会社に行くとき', arriveBy: DateTime.now(), transitLocation: '秋葉原'),
      new Alarm(
          name: '病院に行くとき', arriveBy: DateTime.now(), transitLocation: 'お茶の水')
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'transitLocation': transitLocation,
      'arriveBy': arriveBy,
    };
  }
}
