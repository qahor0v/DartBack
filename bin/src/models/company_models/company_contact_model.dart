class CompanyContactItem {
  String name;
  String startWork;
  String endWork;
  String url;
  String companyID;
  String id;

  CompanyContactItem({
    required this.name,
    required this.startWork,
    required this.endWork,
    required this.url,
    required this.companyID,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'startWork': startWork,
      'endWork': endWork,
      'url': url,
      'companyID': companyID,
      'id': id,
    };
  }

  factory CompanyContactItem.fromJson(Map<String, dynamic> jsonData) {
    return CompanyContactItem(
      name: jsonData['name'],
      startWork: jsonData['startWork'],
      endWork: jsonData['endWork'],
      url: jsonData['url'],
      id: jsonData['id'],
      companyID: jsonData['companyID'],
    );
  }
}
