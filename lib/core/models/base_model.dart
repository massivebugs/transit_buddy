class BaseModel {
  final String tableName;
  String id;
  BaseModel(this.tableName);
  // create
  // find
  // delete
  // update
  // all
  static List<BaseModel> all() {
    // Retrieve all items based on table name
    return [];
  }
  // Map<String, dynamic> toMap();
}
