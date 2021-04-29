import 'package:trainbuddy/core/services/train_information_service/src/interfaces/get_transit_data_strategy.dart';

class FakeGetTransitDataStrategy implements GetTransitDataStrategy {
  @override
  String getTransitData() {
    return 'Test transit data';
  }
}
