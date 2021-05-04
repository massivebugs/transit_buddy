import 'package:transit_buddy/core/services/transit_information/src/interfaces/transit_data_strategy.dart';

class FailTransitDataStrategy implements TransitDataStrategy {
  @override
  List<Map<String, dynamic>> getTransitData(String from, String to) {
    return null;
  }
}
