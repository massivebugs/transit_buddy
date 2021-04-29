import 'package:trainbuddy/core/services/train_information_service/src/interfaces/get_transit_data_strategy.dart';
import 'package:trainbuddy/core/services/train_information_service/src/interfaces/parse_data_strategy.dart';

class TransitInformationService {
  GetTransitDataStrategy getTransitDataStrategy;
  ParseTransitDataStrategy parseTransitDataStrategy;

  TransitInformationService(
      this.getTransitDataStrategy, this.parseTransitDataStrategy);
}
