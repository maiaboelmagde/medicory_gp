class ImagesModel {
  final int id;
  final String name;
  final String description;
  final String? imageResult;
  final String? resultNotes;
  final bool status;
  final String? createdAt;
  final String? updatedAt;

  const ImagesModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageResult,
      required this.resultNotes,
      required this.status,
      required this.createdAt,
      required this.updatedAt});

  factory ImagesModel.fromjson(JsonData) {
    return ImagesModel(
        id: JsonData['id'],
        name: JsonData['name'],
        description: JsonData['description'],
        imageResult: JsonData['imageResult'],
        resultNotes: JsonData['resultNotes'],
        status: JsonData['status'],
        createdAt: JsonData['createdAt'],
        updatedAt: JsonData['updatedAt']);
  }
}
