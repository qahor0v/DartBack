class CustomException {
  String title;
  int statusCode;

  CustomException(
    this.statusCode,
    this.title,
  );

  CustomException.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        statusCode = json['statusCode'];

  Map<String, dynamic> toJson() => {
        "title": title,
        "statusCode": statusCode,
      };
}
