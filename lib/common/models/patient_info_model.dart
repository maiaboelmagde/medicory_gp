class PatientInfoModel {
  final String name;
  final int age;
  final String gender;
  final String phoneNumbers;
  final String relativePhoneNumbers;
  final String address;
  final String bloodType;
  final String email;
  final String code;

  const PatientInfoModel(
      {required this.code,
      required this.name,
      required this.age,
      required this.gender,
      required this.phoneNumbers,
      required this.relativePhoneNumbers,
      required this.address,
      required this.bloodType,
      required this.email});

  factory PatientInfoModel.fromjson(jsonData, {required String userCode}) {
    return PatientInfoModel(
        code: userCode,
        name: jsonData["name"],
        age: jsonData['age'],
        gender: jsonData['gender'],
        phoneNumbers: jsonData['phoneNumbers'][0],
        relativePhoneNumbers: jsonData['relativePhoneNumbers'][0],
        address: jsonData['address'],
        bloodType: jsonData['bloodType'],
        email: jsonData['email']);
  }
}
