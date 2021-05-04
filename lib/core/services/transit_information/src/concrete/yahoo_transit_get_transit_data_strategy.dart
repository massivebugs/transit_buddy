import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:html/dom.dart';

class WebScrapingService {
  static const String REQUEST_URL = "https://transit.yahoo.co.jp";
  static const String REQUEST_ENDPOINT = "/search/result";
  static const List<String> REQUEST_PARAMS = ["from", "to"];
  static const List TRAIN_ROUTE_CHILDREN = [
    {
      'name': 'summary',
      'query': '.routeSummary',
      'children': [
        {'name': 'time', 'query': '.time'},
        {'name': 'transfer', 'query': '.transfer'},
        {'name': 'fare', 'query': '.fare'}
      ]
    }
  ];

  void makeRequest() async {
    // var response = await http.get('https://transit.yahoo.co.jp/search/result?')
    final html =
        await File('../../test/data/yahoo_transit/test.html').readAsString();

    var document = parse(html);
    var routes = document.querySelectorAll('#srline > div[id^=\'route\']');
    routes.forEach((element) {
      var summary = element.querySelector('.routeSummary');
      var time = summary.querySelector('.time');
      var fare = summary.querySelector('.fare');
      var distance = summary.querySelector('.distance');

      print(time.text);
    });
  }
}

void main() {
  WebScrapingService().makeRequest();
}
