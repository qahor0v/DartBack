class CompanyNearly {
  String name;
  String image;
  String rating;
  double lon;
  double lat;
  String title;
  String address;
  String orient;

  CompanyNearly({
    required this.name,
    required this.image,
    required this.rating,
    required this.lon,
    required this.lat,
    required this.title,
    required this.address,
    required this.orient,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'rating': rating,
      'lon': lon,
      'lat': lat,
      'title': title,
      'address': address,
      'orient': orient,
    };
  }

  factory CompanyNearly.fromJson(Map<String, dynamic> data) {
    return CompanyNearly(
      name: data['name'],
      image: data['image'],
      rating: data['rating'],
      lon: data['lon'],
      lat: data['lat'],
      title: data['title'],
      address: data['address'],
      orient: data['orient'],
    );
  }
}
