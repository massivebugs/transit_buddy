import 'package:transit_buddy/core/services/transit_information/src/interfaces/get_transit_data_strategy.dart';
import 'package:transit_buddy/core/services/transit_information/src/interfaces/parse_data_strategy.dart';

class TransitInformationService {
  GetTransitDataStrategy getTransitDataStrategy;
  ParseTransitDataStrategy parseTransitDataStrategy;

  TransitInformationService(
      this.getTransitDataStrategy, this.parseTransitDataStrategy);
}
