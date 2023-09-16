class CompanyVideo {
  String id;
  String title;
  String description;
  String duration;
  String thumbnail;
  String url;
  String createdTime;
  int views;
  int likes;

  CompanyVideo({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.thumbnail,
    required this.url,
    required this.createdTime,
    required this.views,
    required this.likes,
  });

  factory CompanyVideo.fromJson(Map<String, dynamic> json) {
    return CompanyVideo(
      id: json['id'],
      views: json['views'],
      likes: json['likes'],
      createdTime: json['createdTime'],
      title: json['title'],
      description: json['description'],
      duration: json['duration'],
      thumbnail: json['thumbnail'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'duration': duration,
      'thumbnail': thumbnail,
      'url': url,
      'createdTime': createdTime,
      'views': views,
      'likes': likes,
    };
  }
}
