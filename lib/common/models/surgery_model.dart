class SurgeryModel {
  final num id;
  final String name;
  final String description;
  final String createdAt;
  final String updatedAt;

  const SurgeryModel(
      {required this.id,
        required this.createdAt,
      required this.updatedAt,
      required this.name,
      required this.description});

  factory SurgeryModel.fromjson(jsonData) {
    return SurgeryModel(
      id: jsonData['id'],
        createdAt: jsonData['createdAt'],
        updatedAt: jsonData['updatedAt'],
        name: jsonData['name'],
        description: jsonData['description']);
  }
}
