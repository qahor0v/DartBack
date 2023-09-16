class CompanyImage {
  String id;
  String title;
  String description;
  String url;
  String createdTime;
  int likes;

  CompanyImage({
    required this.id,
    required this.title,
    required this.description,
    required this.url,
    required this.createdTime,
    required this.likes,
  });

  factory CompanyImage.fromJson(Map<String, dynamic> json) {
    return CompanyImage(
      id: json['id'],
      likes: json['likes'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      createdTime: json['createdTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'url': url,
      'createdTime': createdTime,
      'likes': likes,
    };
  }
}
