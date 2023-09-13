class CompanyContactItem {
  String name;
  String startWork;
  String endWork;
  String url;

  CompanyContactItem({
    required this.name,
    required this.startWork,
    required this.endWork,
    required this.url,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'startWork': startWork,
      'endWork': endWork,
      'url': url,
    };
  }

  factory CompanyContactItem.fromJson(Map<String, dynamic> jsonData) {
    return CompanyContactItem(
      name: jsonData['name'],
      startWork: jsonData['startWork'],
      endWork: jsonData['endWork'],
      url: jsonData['url'],
    );
  }
}
