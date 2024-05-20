class PatientInfoModel {
  final String name;
  final int age;
  final String gender;
  final String phoneNumbers;
  final String relativePhoneNumbers;
  final String address;
  final String bloodType;
  final String email;

  const PatientInfoModel(
      {required this.name,
      required this.age,
      required this.gender,
      required this.phoneNumbers,
      required this.relativePhoneNumbers,
      required this.address,
      required this.bloodType,
      required this.email});

  factory PatientInfoModel.fromjson(jsonData) {
    return PatientInfoModel(
      name: jsonData["name"],
      age: jsonData['age'],
      gender: jsonData['gender'],
      phoneNumbers: jsonData['phoneNumbers'],
      relativePhoneNumbers: jsonData['relativePhoneNumbers'],
      address: jsonData['address'],
      bloodType: jsonData['bloodType'],
      email: jsonData['email']
    );
  }
}
