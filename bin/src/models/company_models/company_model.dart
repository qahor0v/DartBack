class Company {
  String id;
  String username;
  String name;
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
    required this.name,
    required this.title,
    required this.slogan,
    required this.registeredTime,
    required this.description,
    required this.image,
    required this.rating,
    required this.subscribes,
  });

   factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      username: json['username'],
      name: json['name'],
      title: json['title'],
      slogan: json['slogan'],
      registeredTime: json['registeredTime'],
      description: json['description'],
      image: json['image'],
      rating: json['rating'].toDouble(),
       subscribes: json['subscribes'],
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'name': name,
      'title': title,
      'slogan': slogan,
      'registeredTime': registeredTime,
      'description': description,
      'image': image,
      'rating': rating,
      'subscribes': subscribes,
    };
  }
}
