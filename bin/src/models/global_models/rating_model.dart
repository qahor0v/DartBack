class RatingModel {
  String id;
  String message;
  double rating;
  String userImage;
  String userID;
  String username;

  RatingModel({
    required this.id,
    required this.message,
    required this.rating,
    required this.userImage,
    required this.userID,
    required this.username,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      id: json['id'],
      message: json['message'],
      rating: json['rating'].toDouble(),
      userImage: json['userImage'],
      userID: json['userID'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'message': message,
      'rating': rating,
      'userImage': userImage,
      'userID': userID,
      'username': username,
    };
  }
}
