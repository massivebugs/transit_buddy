import 'package:meta/meta.dart';

class Alarm {
  final int id;
  final String name;
  final String transitLocation;
  final DateTime arriveBy;

  Alarm(
      {this.id,
      @required this.name,
      @required this.transitLocation,
      @required this.arriveBy});
}
