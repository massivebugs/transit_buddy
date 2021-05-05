import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:transit_buddy/core/services/transit_information/src/interfaces/transit_data_strategy.dart';

class YahooTransitDataStrategy implements TransitDataStrategy {
  static const String REQUEST_URL =
      "https://transit.yahoo.co.jp/search/result?";

  static const int NEXT_ROUTE = 2;
  static const int HAS_ARRIVE_AND_DEPART = 2;

  @override
  Future<List<Map<String, dynamic>>> getTransitData(from, to) async {
    // Map containing all data based on methods
    final data = [];

    // Used to filter out '着, 発' like information
    final dateRegex = RegExp(r'\d\d:\d\d');

    // Make http request to page and parse as DOM
    var response = await http.get('${REQUEST_URL}from=$from&to=$to');
    var document = parse(response.body);

    // The methods represent the methods one can take to reach destination
    var methods = document.querySelectorAll('#srline > div[id^=\'route\']');
    methods.forEach((method) {
      try {
        // List to store current route information
        final List transitData = <Map<String, dynamic>>[];

        // var summary = element.querySelector('.routeSummary');
        // var time = summary.querySelector('.time');
        // var fare = summary.querySelector('.fare');
        // var distance = summary.querySelector('.distance');

        var routesInformation = method.querySelectorAll('.routeDetail > div');

        for (int i = 0; i < routesInformation.length; i += NEXT_ROUTE) {
          // Extract from info
          var from = routesInformation[i].querySelector('dl > dt');

          // Extract depart info - The parent <ul>.time might have
          // both arrive and depart times depending on routes
          var times = routesInformation[i].querySelectorAll('.time li');
          var depart =
              times.length == HAS_ARRIVE_AND_DEPART ? times[1] : times[0];

          // These fields might be [null] depending on
          // which route we are inspecting
          var transitType;
          var to;
          var arrive;

          // Used to prevent out of bounds err when on last detail
          if (i < routesInformation.length - 1) {
            // Extract transitType info
            var transitTypeText = routesInformation[i + 1].text;
            if (transitTypeText.contains('walk')) {
              transitType = 'walk';
            } else if (transitTypeText.contains('bus')) {
              transitType = 'bus';
            } else if (transitTypeText.contains('train')) {
              transitType = 'train';
            } else {
              transitType = 'unknown';
            }

            // Extract to info
            to = routesInformation[i + NEXT_ROUTE].querySelector('dl > dt');

            arrive =
                routesInformation[i + NEXT_ROUTE].querySelector('.time li');

            transitData.add({
              'transitType': transitType,
              'from': from.text,
              'to': to?.text,
              'depart': dateRegex.stringMatch(depart.text)?.toString(),
              'arrive': dateRegex.stringMatch(arrive?.text)?.toString(),
            });
          }
        }
        data.add(transitData);
      } catch (err) {
        // TODO: Default behaviour for when parsing has failed
      }
    });
    // Return only the first method details for now
    return data.length > 0 ? data[0] : [];
  }
}

void main() {
  YahooTransitDataStrategy().getTransitData('吉川', '秋葉原駅');
}
