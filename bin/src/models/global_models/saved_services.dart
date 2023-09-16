class SavedServices {
  String id;
  String userID;
  String companyID;
  String companyTitle;
  String serviceID;
  String serviceTitle;
  String serviceImage;

  SavedServices({
    required this.id,
    required this.userID,
    required this.companyID,
    required this.companyTitle,
    required this.serviceID,
    required this.serviceTitle,
    required this.serviceImage,
  });

  factory SavedServices.fromJson(Map<String, dynamic> json) {
    return SavedServices(
      id: json['id'],
      userID: json['userID'],
      companyID: json['companyID'],
      companyTitle: json['companyTitle'],
      serviceID: json['serviceID'],
      serviceTitle: json['serviceTitle'],
      serviceImage: json['serviceImage'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "userID": userID,
        "companyID": companyID,
        "companyTitle": companyTitle,
        "serviceID": serviceID,
        "serviceTitle": serviceTitle,
        "serviceImage": serviceImage,
      };
}
