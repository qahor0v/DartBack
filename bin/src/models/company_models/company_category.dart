class CompanyCategory {
  String id;
  String icon;
  String description;
  String title;

  CompanyCategory({
    required this.id,
    required this.icon,
    required this.description,
    required this.title,
  });

  factory CompanyCategory.fromJson(Map<String, dynamic> json) {
    return CompanyCategory(
      id: json['id'],
      icon: json['icon'],
      description: json['description'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'icon': icon,
      'description': description,
      'title': title,
    };
  }
}
