import 'company_contact_model.dart';

class CompanyContact {
  List<CompanyContactItem> emails;
  List<CompanyContactItem> telegrams;
  List<CompanyContactItem> phones;

  CompanyContact({
    required this.emails,
    required this.telegrams,
    required this.phones,
  });

  Map<String, dynamic> toJson() {
    return {
      'emails': emails.map((e) => e.toJson()).toList(),
      'telegrams': telegrams.map((e) => e.toJson()).toList(),
      'phones': phones.map((e) => e.toJson()).toList(),
    };
  }

  factory CompanyContact.fromJson(Map<String, dynamic> jsonData) {
    return CompanyContact(
      emails: jsonData['emails']
          .map((e) => CompanyContactItem.fromJson(e))
          .toList(),
      telegrams: jsonData['telegrams']
          .map((e) => CompanyContactItem.fromJson(e))
          .toList(),
      phones: jsonData['phones']
          .map((e) => CompanyContactItem.fromJson(e))
          .toList(),
    );
  }
}
