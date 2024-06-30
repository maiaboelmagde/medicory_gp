class LoginInfo {
  final num id;
  final String token;
  final String email;

  const LoginInfo({
    required this.id,
    required this.token,
    required this.email,
  });

  factory LoginInfo.fromjson(jsonData) {
    return LoginInfo(
      id: jsonData['id'],
      token: jsonData['token'],
      email: jsonData['email'],
    );
  }
}
