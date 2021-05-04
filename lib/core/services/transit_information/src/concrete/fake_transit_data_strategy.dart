import 'package:transit_buddy/core/services/transit_information/src/interfaces/transit_data_strategy.dart';

class FakeTransitDataStrategy implements TransitDataStrategy {
  @override
  List<Map<String, dynamic>> getTransitData(String from, String to) {
    final now = DateTime.now();
    return [
      {
        'transitType': 'walk',
        'from': '大字平沼',
        'to': '吉川駅',
        'depart': now.toString(),
        'arrive': now.add(Duration(hours: 1)).toString(),
        'details': {'extra': 'details'}
      },
      {
        'transitType': 'train',
        'from': '吉川駅',
        'to': '南浦和駅',
        'depart': now.add(Duration(hours: 1)).toString(),
        'arrive': now.add(Duration(hours: 2)).toString(),
        'details': {'extra': 'details'}
      },
      {
        'transitType': 'bus',
        'from': '南浦和駅',
        'to': '秋葉原駅',
        'depart': now.add(Duration(hours: 2)).toString(),
        'arrive': now.add(Duration(hours: 3)).toString(),
        'details': {'extra': 'details'}
      },
    ];
  }
}
