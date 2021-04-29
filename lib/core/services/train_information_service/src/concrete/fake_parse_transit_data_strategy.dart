import 'package:trainbuddy/core/services/train_information_service/src/interfaces/parse_data_strategy.dart';

class FakeParseTransitDataStrategy implements ParseTransitDataStrategy {
  @override
  List parseTransitData() {
    return ['Test route 1', 'Test route 2'];
  }
}
