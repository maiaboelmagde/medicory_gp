class OwnerModel{
  final num id ;
  final String firstName;
  final String middleName;
  final String lastName;
  final String gender;
  final String code;

  const OwnerModel({required this.id, required this.gender, required this.firstName, required this.middleName, required this.lastName, required this.code});
  factory OwnerModel.fromjson(jsonData){
    return OwnerModel(id: jsonData['id'], gender: jsonData['gender'], firstName: jsonData['firstName'], middleName: jsonData['middleName'], lastName: jsonData['lastName'], code: jsonData['user']['code']);
  }
}