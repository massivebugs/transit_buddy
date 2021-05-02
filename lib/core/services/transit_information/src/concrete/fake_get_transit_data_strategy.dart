import 'package:transit_buddy/core/services/transit_information/src/interfaces/get_transit_data_strategy.dart';

class FakeGetTransitDataStrategy implements GetTransitDataStrategy {
  @override
  String getTransitData() {
    return 'Test transit data';
  }
}
