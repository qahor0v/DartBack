class CompanyImage {
  String id;
  String title;
  String description;
  String url;
  String createdTime;

  CompanyImage({
    required this.id,
    required this.title,
    required this.description,
    required this.url,
    required this.createdTime,
  });

  factory CompanyImage.fromJson(Map<String, dynamic> json) {
    return CompanyImage(
      id: json['id'],
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
    };
  }
}
