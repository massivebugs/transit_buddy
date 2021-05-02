// import 'package:transit_buddy/constants/app_constants.dart';
// import 'package:web_scraper/web_scraper.dart';
// import 'dart:io';

class WebScrapingService {
  // // final webScraper = WebScraper(AppConstants.REQUEST_URL);
  // final WebScraper _scraper;
  // WebScrapingService() : _scraper = WebScraper();

  // void makeRequest() async {
  //   final html = await File('test.html').readAsString();

  //   if (scraper.loadFromString(html)) {
  //     // .loadWebPage(AppConstants.REQUEST_ENDPOINT + '?from=吉川&to=お茶の水')) {

  //     final Map data = {};

  //     final routes =
  //         scraper.getElementAttribute(AppConstants.ELEMENTS['routes'], 'id');
  //     print('There are ${routes.length} routes');
  //     routes.forEach((route) {
  //       print('===========================================================');
  //       final routeTime = scraper.getElementTitle(
  //           '#' + route + AppConstants.ELEMENTS['summary']['time']);
  //       final routeTransfer = scraper.getElementTitle(
  //           '#' + route + AppConstants.ELEMENTS['summary']['transfer']);
  //       final routeFare = scraper.getElementTitle(
  //           '#' + route + AppConstants.ELEMENTS['summary']['fare']);
  //       print(routeTime);
  //       print(routeTransfer);
  //       print(routeFare);
  //       print('===========================================================');
  //     });

  // final details = webScraper.getElementTitle(
  //     'div#route01 .routeDetail > .station, div#route01.routeDetail > .fareSection');
  // print(details);
  // final stations = webScraper
  //     .getElementTitle('div#route01 .routeDetail .station'); // 駅（複数可）
  // final times =
  //     webScraper.getElementTitle('div#route01 .routeDetail .station .time');
  // final stationNames =
  //     webScraper.getElementTitle('div#route01 .routeDetail .station dl dt a');

  // stations.forEach((station) {
  //   final index = stations.indexOf(station);
  //   print(times[index] + ': ' + stationNames[index]);
  //   print('-------------------------------');
  // });

  // print(webScraper
  //     .getElement('div#route01 .routeDetail .time li', [])); // 駅（複数可）
  // }
  // }
}

// Lets learn more about asynchronous requests

// void main() {}
