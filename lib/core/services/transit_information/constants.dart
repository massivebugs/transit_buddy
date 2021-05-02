class AppConstants {
  static const String REQUEST_URL = "https://transit.yahoo.co.jp";
  static const String REQUEST_ENDPOINT = "/search/result";
  static const List<String> REQUEST_PARAMS = ["from", "to"];
  static const TRAIN_ROUTE = '#srline > div[id^=\'route\']';
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
}
