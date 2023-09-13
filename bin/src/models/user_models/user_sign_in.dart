class UserSignIn {
  String login;
  String password;

  UserSignIn({
    required this.login,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'password': password,
    };
  }

  factory UserSignIn.fromJson(Map<String, dynamic> jsonData) {
    return UserSignIn(
      login: jsonData['login'],
      password: jsonData['password'],
    );
  }
}
