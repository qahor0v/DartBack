class User {
  String id;
  String lastName;
  String firstName;
  String email;
  String password;
  String phoneNumber;
  String profileImage;
  String profileRegisterTime;

  User({
    required this.id,
    required this.lastName,
    required this.firstName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.profileImage,
    required this.profileRegisterTime,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      lastName: json['lastName'],
      firstName: json['firstName'],
      email: json['email'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      profileImage: json['profileImage'],
      profileRegisterTime: json['profileRegisterTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lastName': lastName,
      'firstName': firstName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'profileImage': profileImage,
      'profileRegisterTime': profileRegisterTime,
    };
  }
}
