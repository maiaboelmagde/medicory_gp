class DiseaseModel {
  final num id;
  final String name;
  final String information;
  final String createdAt;
  final String updatedAt;

  const DiseaseModel(
      {required this.id,
      required this.name,
      required this.information,
      required this.createdAt,
      required this.updatedAt});

  factory DiseaseModel.fromjson(jsonData) {
    return DiseaseModel(
        id: jsonData['id'],
        name: jsonData['name'],
        information: jsonData['information'],
        createdAt: jsonData['createdAt'],
        updatedAt: jsonData['updatedAt']);
  }
}
