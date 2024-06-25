class TestsModel {
  final int id;
  final String name;
  final String description;
  final String? testNotes;
  final String? testResult;
  final bool status;
  final String? createdAt;
  final String? updatedAt;

  const TestsModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.testNotes,
      required this.testResult,
      required this.status,
      required this.createdAt,
      required this.updatedAt});

  factory TestsModel.fromjson(JsonData) {
    return TestsModel(
        id: JsonData['id'],
        name: JsonData['name'],
        description: JsonData['description'],
        testNotes: JsonData['testNotes'],
        testResult: JsonData['testResult'],
        status: JsonData['status'],
        createdAt: JsonData['createdAt'],
        updatedAt: JsonData['updatedAt']);
  }
}
