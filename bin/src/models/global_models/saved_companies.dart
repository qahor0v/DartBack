class SavedCompanies {
  String id;
  String userID;
  String companyID;
  String companyTitle;
  String companyImage;

  SavedCompanies({
    required this.id,
    required this.userID,
    required this.companyID,
    required this.companyImage,
    required this.companyTitle,
  });

  factory SavedCompanies.fromJson(Map<String, dynamic> json) {
    return SavedCompanies(
      id: json['id'],
      userID: json['userID'],
      companyID: json['companyID'],
      companyImage: json['companyImage'],
      companyTitle: json['companyTitle'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "userID": userID,
        "companyID": companyID,
        "companyTitle": companyTitle,
        "companyImage": companyImage,
      };
}
