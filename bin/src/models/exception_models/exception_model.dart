class CustomException {
  String title;
  int statusCode;
  String token;

  CustomException({
    required this.statusCode,
    required this.title,
    required this.token,
  });

  CustomException.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        statusCode = json['statusCode'],
        token = json['token'];

  Map<String, dynamic> toJson() => {
        "title": title,
        "statusCode": statusCode,
        "token": token,
      };

  static final CustomException alreadyHave = CustomException(
    statusCode: 701,
    title: "User allaqachon mavjud",
    token: "",
  );
}
