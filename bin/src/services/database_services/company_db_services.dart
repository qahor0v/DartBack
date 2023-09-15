import 'dart:developer';

import '../../models/company_models/company_model.dart';
import 'company_db_services_base.dart';

class CompanyDatabaseServices extends CompanyDatabaseServicesBase {
  @override
  void initDatabase() {
    database.execute('''
    CREATE TABLE IF NOT EXISTS $tableName (
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
  void addCompany(Company company) {
    final statement = database.prepare('''
    INSERT INTO $tableName (
      id, username, email, password, phoneNumber, 
      title, slogan, registeredTime, description, 
      image, rating, subscribes
    )
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''');
    statement.execute([
      company.id,
      company.username,
      company.email,
      company.password,
      company.phoneNumber,
      company.title,
      company.slogan,
      company.registeredTime,
      company.description,
      company.image,
      company.rating.toString(),
      company.subscribes,
    ]);
    log("Added to users.db");
    statement.dispose();
  }

  @override
  void deleteCompany(String id) {
    final statement = database.prepare('DELETE FROM $tableName WHERE id = ?');
    statement.execute([id]);
    statement.dispose();
  }

  @override
  Company? getCompanyByEmail(String email) {
    final statement =
        database.prepare('SELECT * FROM $tableName WHERE email = ?');
    final results = statement.select([email]);
    statement.dispose();
    if (results.isNotEmpty) {
      return Company.fromJson(results.first);
    }
    return null;
  }

  @override
  Company? getCompanyById(String id) {
      final statement = database.prepare('SELECT * FROM $tableName WHERE id = ?');
      final results = statement.select([id]);
      statement.dispose();
      if (results.isNotEmpty) {
        return Company.fromJson(results.first);
      }
      return null;
  }

  @override
  Company? getCompanyByPhoneNumber(String phoneNumber) {
    final statement =
        database.prepare('SELECT * FROM $tableName WHERE phoneNumber = ?');
    final results = statement.select([phoneNumber]);
    statement.dispose();
    if (results.isNotEmpty) {
      return Company.fromJson(results.first);
    }
    return null;
  }

  @override
  Company? getCompanyByUsername(String username) {
    final statement =
        database.prepare('SELECT * FROM $tableName WHERE username = ?');
    final results = statement.select([username]);
    statement.dispose();
    if (results.isNotEmpty) {
      return Company.fromJson(results.first);
    }
    return null;
  }

  @override
  void updateCompany(Company company) {
    final statement = database.prepare('''
    UPDATE $tableName
    SET username = ?, email = ?, password = ?, phoneNumber = ?, 
      title = ?, slogan = ?, registeredTime = ?, description = ?, 
      image = ?, rating = ?, subscribes = ?
    WHERE id = ?
  ''');

    statement.execute([
      company.id,
      company.username,
      company.email,
      company.password,
      company.phoneNumber,
      company.title,
      company.slogan,
      company.registeredTime,
      company.description,
      company.image,
      company.rating.toString(),
      company.subscribes,
    ]);
    log("Updated to users.db");
    statement.dispose();
  }

  @override
  List<Company> getCompanies(int length) {
    return <Company>[];
  }
}
