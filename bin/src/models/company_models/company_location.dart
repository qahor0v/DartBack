class CompanyLocation {
  String title;
  String description;
  double lon;
  double lat;
  String orientr;

  CompanyLocation({
    required this.title,
    required this.description,
    required this.lon,
    required this.lat,
    required this.orientr,
  });

  factory CompanyLocation.fromJson(Map<String, dynamic> json) {
    return CompanyLocation(
      title: json['title'],
      description: json['description'],
      lon: json['lon'].toDouble(),
      lat: json['lat'].toDouble(),
      orientr: json['orientr'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'lon': lon,
      'lat': lat,
      'orientr': orientr,
    };
  }
}
