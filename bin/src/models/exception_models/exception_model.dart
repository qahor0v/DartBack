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

  static CustomException signedIn(String token) => CustomException(
        statusCode: 797,
        title: "Hisobga muvaffaqiyatli kirildi",
        token: token,
      );

  static final CustomException notFound = CustomException(
    statusCode: 713,
    title: "Hisob mavjud emas!",
    token: "",
  );

  static final CustomException deleted = CustomException(
    statusCode: 700,
    title: "Tashkilot o'chirildi!",
    token: '',
  );

  static CustomException registered(String token) => CustomException(
        statusCode: 777,
        title: "Hisob muvaffaqiyatli ro'yxatga olindi!",
        token: token,
      );

  static CustomException updated(String token) => CustomException(
        statusCode: 707,
        title: "Hisob ma'lumotlari muvaffaqiyatli yangilandi!",
        token: token,
      );
}
