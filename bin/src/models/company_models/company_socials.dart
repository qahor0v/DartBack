class CompanySocials {
  String web;
  String instagram;
  String telegram;
  String youtube;
  String facebook;
  String tiktok;
  String twitter;
  String linkedin;

  CompanySocials({
    required this.web,
    required this.instagram,
    required this.telegram,
    required this.youtube,
    required this.facebook,
    required this.tiktok,
    required this.twitter,
    required this.linkedin,
  });

  factory CompanySocials.fromJson(Map<String, dynamic> json) {
    return CompanySocials(
      web: json['web'],
      instagram: json['instagram'],
      telegram: json['telegram'],
      youtube: json['youtube'],
      facebook: json['facebook'],
      tiktok: json['tiktok'],
      twitter: json['twitter'],
      linkedin: json['linkedin'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'web': web,
      'instagram': instagram,
      'telegram': telegram,
      'youtube': youtube,
      'facebook': facebook,
      'tiktok': tiktok,
      'twitter': twitter,
      'linkedin': linkedin,
    };
  }
}
