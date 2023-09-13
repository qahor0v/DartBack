class CompanyService {
  String title;
  String id;
  String image;
  String description;
  String companyID;
  String companyName;
  String companyImage;
  String url;
  String urlTitle;
  double price;

  CompanyService({
    required this.title,
    required this.id,
    required this.image,
    required this.description,
    required this.companyID,
    required this.companyName,
    required this.companyImage,
    required this.url,
    required this.urlTitle,
    required this.price,
  });

  factory CompanyService.fromJson(Map<String, dynamic> json) {
    return CompanyService(
      title: json['title'],
      id: json['id'],
      image: json['image'],
      description: json['description'],
      companyID: json['companyID'],
      companyName: json['companyName'],
      companyImage: json['companyImage'],
      url: json['url'],
      urlTitle: json['urlTitle'],
      price: json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'id': id,
      'image': image,
      'description': description,
      'companyID': companyID,
      'companyName': companyName,
      'companyImage': companyImage,
      'url': url,
      'urlTitle': urlTitle,
      'price': price,
    };
  }
}
