import 'package:transit_buddy/core/services/transit_information/src/interfaces/transit_data_strategy.dart';

import 'package:meta/meta.dart';

class TransitInformationService {
  final TransitDataStrategy transitDataStrategy;
  TransitInformationService({@required this.transitDataStrategy});

  List<Map<String, dynamic>> getInformation(from, to) {
    return transitDataStrategy.getTransitData(from, to);
  }
}
