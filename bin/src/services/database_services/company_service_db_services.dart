// ignore_for_file: empty_catches

import '../../models/company_models/company_service_model.dart';
import 'company_service_db_services_base.dart';

class CompanyServicesDbService extends CompanyServicesDbServiceBase {
  @override
  void addService(CompanyService service) {
    final statement = database.prepare('''
    INSERT INTO $tableName (
      title, id, image, description, companyID, 
      companyName, companyImage, url, urlTitle, 
      price
    )
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''');
    statement.execute([
      service.title,
      service.id,
      service.image,
      service.description,
      service.companyID,
      service.companyName,
      service.companyImage,
      service.url,
      service.urlTitle,
      service.price,
    ]);
    statement.dispose();
  }

  @override
  void deleteService(String id) {
    final statement = database.prepare('DELETE FROM $tableName WHERE id = ?');
    statement.execute([id]);
    statement.dispose();
  }

  @override
  void disposeDatabase() => database.dispose();

  @override
  List<CompanyService> getServiceByCompanyID(String companyID) {
    List<CompanyService> servicesList = [];
    final statement = database.prepare(
      'SELECT * FROM $tableName WHERE companyID = ?',
    );
    final results = statement.select([companyID]);
    statement.dispose();
    for (final res in results) {
      try {
        servicesList.add(CompanyService.fromJson(res));
      } catch (e) {}
    }
    return servicesList;
  }

  @override
  CompanyService? getServiceById(String id) {
    final statement = database.prepare('SELECT * FROM $tableName WHERE id = ?');
    final results = statement.select([id]);
    statement.dispose();
    if (results.isNotEmpty) {
      return CompanyService.fromJson(results.first);
    }
    return null;
  }

  @override
  List<CompanyService> getServices(int length) {
    throw UnimplementedError();
  }

  @override
  void initDatabase() {
    database.execute('''
    CREATE TABLE IF NOT EXISTS $tableName (
      id TEXT,
      image TEXT,
      description TEXT,
      title TEXT,
      companyID TEXT,
      companyName TEXT,
      companyImage TEXT,
      url TEXT,
      urlTitle TEXT,
      price TEXT,
    )
  ''');
  }

  @override
  void updateService(CompanyService service) {}
}
