import 'dart:developer';

import '../../models/company_models/company_model.dart';
import 'company_db_services_base.dart';

class CompanyDatabaseServices extends CompanyDatabaseServicesBase {
  @override
  void initDatabase() {
    database.execute('''
    CREATE TABLE IF NOT EXISTS users (
      id TEXT,
      username TEXT,
      email TEXT,
      phoneNumber TEXT,
      password TEXT,
      title TEXT,
      slogan TEXT,
      registeredTime TEXT,
      description TEXT,
      image TEXT,
      rating TEXT,
      subscribes INTEGER
    )
  ''');
    log("Initialized to companies.db");
  }

  @override
  void disposeDatabase() => database.dispose();

  @override
  void addCompany(Company company) {}

  @override
  void deleteCompany(String id) {}

  @override
  Company? getCompanyByEmail(String email) {
    throw UnimplementedError();
  }

  @override
  Company? getCompanyById(String id) {
    throw UnimplementedError();
  }

  @override
  Company? getCompanyByPhoneNumber(String phoneNumber) {
    throw UnimplementedError();
  }

  @override
  Company? getCompanyByUsername(String username) {
    throw UnimplementedError();
  }

  @override
  void updateCompany(Company company) {}
}
