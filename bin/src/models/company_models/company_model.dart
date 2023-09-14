class Company {
  String id;
  String username;
  String email;
  String phoneNumber;
  String password;
  String title;
  String slogan;
  String registeredTime;
  String description;
  String image;
  double rating;
  int subscribes;

  Company({
    required this.id,
    required this.username,
    required this.password,
    required this.title,
    required this.slogan,
    required this.registeredTime,
    required this.description,
    required this.image,
    required this.rating,
    required this.subscribes,
    required this.email,
    required this.phoneNumber,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      username: json['username'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      password: json['password'],
      title: json['title'],
      slogan: json['slogan'],
      registeredTime: json['registeredTime'],
      description: json['description'],
      image: json['image'],
      rating: double.parse(json['rating']),
      subscribes: json['subscribes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'title': title,
      'slogan': slogan,
      'registeredTime': registeredTime,
      'description': description,
      'image': image,
      'rating': rating,
      'subscribes': subscribes,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }
}
