abstract class TransitDataStrategy {
  Future<List<Map<String, dynamic>>> getTransitData(String from, String to);
}
